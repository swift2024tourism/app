import json
import firebase_admin  
from firebase_admin import credentials, firestore ,storage
import os
from PIL import Image
from PIL.ExifTags import TAGS, GPSTAGS
from google.cloud.firestore_v1 import GeoPoint

def get_exif_data(image):
    exif_data = {}
    info = image._getexif()
    if info:
        for tag, value in info.items():
            tag_name = TAGS.get(tag, tag)
            if tag_name == "GPSInfo":
                gps_data = {}
                for t in value:
                    sub_tag = GPSTAGS.get(t, t)
                    gps_data[sub_tag] = value[t]
                exif_data[tag_name] = gps_data
            else:
                exif_data[tag_name] = value
    return exif_data

def get_lat_lon(exif_data):
    gps_info = exif_data.get("GPSInfo")
    if not gps_info:
        return None, None

    def convert_to_degrees(value):
        d = float(value[0].numerator) / float(value[0].denominator)
        m = float(value[1].numerator) / float(value[1].denominator)
        s = float(value[2].numerator) / float(value[2].denominator)
        return d + (m / 60.0) + (s / 3600.0)

    lat = convert_to_degrees(gps_info["GPSLatitude"])
    lon = convert_to_degrees(gps_info["GPSLongitude"])

    if gps_info["GPSLatitudeRef"] != "N":
        lat = -lat
    if gps_info["GPSLongitudeRef"] != "E":
        lon = -lon

    return lat, lon


# Firebase Admin SDKの初期化
cred = credentials.Certificate(r"C:\Users\hoshi\app\uploader\swift2024app-firebase-adminsdk-vk4eb-6af6538459.json")
firebase_admin.initialize_app(cred,{
    'storageBucket':'swift2024app.appspot.com'
})

db = firestore.client()

#-------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------

# 線の中のみをいじってください！！

#写真のアップロード
for i in range(1,15):
    path = "C:\\Users\\hoshi\\app\\uploader\\"
    place = 'goryokaku'
    file = place +'_' + str(i) + '_' + str(1) + '.jpg'
    document_name = 'waypoint_' + place + '_'+ str(i)
    reference_name1 = 'pictures/' + place + '_' +  str(i) + '_1'
    reference_name2 = 'pictures/' + place + '_' + str(i) + '_2'
    reference_example_pictures1  = db.document(reference_name1)
    reference_example_pictures2 = db.document(reference_name2)

    reference_array = [
       reference_example_pictures1,
       reference_example_pictures2
    ]

    print(file)
    try:
        img = Image.open(path + file)  #書き直し
        exif_data = get_exif_data(img)
        lat, lon = get_lat_lon(exif_data)
        geo_point = GeoPoint(lat,lon)
        doc_ref = db.collection('waypoints').document(document_name)
        doc_ref.set({
            'geopoint': geo_point,
            'pictures': reference_array
        })


    except Exception as e:
        print(f"予期しないエラーが発生しました: {e}")
    filename = "goryokaku_"+ str(i)+"_"+str(1)+".jpg"
    filename = "goryokaku_"+ str(i)+"_"+str(2)+".jpg"
    bucket = storage.bucket()
    blob = bucket.blob(filename)
    blob.upload_from_filename(path + filename)
    print(blob.public_url)

    doc_ref1 = db.collection('pictures').document('goryokaku'  + '_' + str(i) + '_' + '1')
    doc_ref2 = db.collection('pictures').document('goryokaku' + '_' + str(i) + '_' + '2')

    url1 = 'https://firebasestorage.googleapis.com/v0/b/swift2024app.appspot.com/o/goryokaku_'+ str(i) + '_1.jpg?alt=media'
    url2 = 'https://firebasestorage.googleapis.com/v0/b/swift2024app.appspot.com/o/goryokaku_' + str(i) + '_2.jpg?alt=media'

    doc_ref1.set({
        'url':url1
    })

    doc_ref2.set({
        'url':url2
    })


#DocumentReferenceを作成
reference_example1 = db.document('waypoints/autotest1')
reference_example2 = db.document('waypoints/autotest2')


data = {
    "games": {
        # ドキュメント名　"autotest1" , 難易度　"easy", エリア　"金森",　座標の参照先 "reference_example1"
        "goryo_easy": {
            "difficulty": "easy", 
            "name": "五稜郭",
            "waypoints": reference_example1
        },
        #2つ目以降
        "goryo_mid": {
            "difficulty": "midium",
            "name": "五稜郭",
            "waypoints": reference_example2
        }
    }
}

#-------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------

#ここからは触らないでください

# Firestoreにデータをアップロード
# 'data'コレクション内の各ドキュメントにデータをセット
for document_id, document_data in data['games'].items():
    doc_ref = db.collection('games').document(document_id)
    doc_ref.set(document_data)



print('アップロード完了')