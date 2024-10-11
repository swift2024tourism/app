import json
import firebase_admin  
from firebase_admin import credentials, firestore ,storage


# Firebase Admin SDKの初期化
cred = credentials.Certificate(r"C:\Users\hoshi\app\uploader\swift2024app-firebase-adminsdk-vk4eb-6af6538459.json")
firebase_admin.initialize_app(cred,{
    'storageBucket':'swift2024app.appspot.com'
})

db = firestore.client()

path = "C:/Users/hoshi/"
filename = "image_123650291.jpeg"
bucket = storage.bucket('swift2024app')
blob = bucket.blob(filename)
blob.upload_from_filename(path + filename)
blob.male_public()

#-------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------

# 線の中のみをいじってください！！


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
print(blob.public_url)