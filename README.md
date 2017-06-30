# bookmanager
本管理するやつ

# Docker  
` ｄocker-compose build `で作成  
` docker-compose up `で起動  
` docker-compose exec web ~` でRailsコマンド実行できるよ  
Ex. DB作成 ` docker-compose exec web rails db:create`

# Nginx
` openssl req -new -days 365 -x509 -nodes -keyout cert.key -out cert.crt `
で証明書と鍵を生成
  
できた cert.key と cert.crt を  

` bookmanager_app/nginx `

に移動  
` docker-compose -f docker-compose.production.yml up `  
で起動
