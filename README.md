# SmartTicket

![Flutter](https://flutter.io/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg "Flutter") <img src="https://www.django-rest-framework.org/img/logo.png" width="100">


SmartTicket let's you be free of the ticket's waiting times. Now when you go to a supermarket or other ticket dependent services you can retrieve a ticket on your phone
simply by scanning a QRCode and keep track of the current ticket being served.

## Technologies Used
* Flutter
* Django Rest Framework

### The API's
In order to develop this platform I had to develop two API's using django rest framework.
This was to show that you can have multiple services/stores all in the same app, in this example I had a supermarket and the citizen card store.


### The mobile App
This was developed using Flutter and by scaning a QRCode you would acess an API which would give all the ticekt based services available on the store (the owner of the API). After that you can choose all the services you want and you will get a ticket and the current ticket will be displayed in real time so you can go and do your shopping or other affairs without having to worry about the tickets.

### API's:
* https://smartticket-lojadocidadao.herokuapp.com/services/
* https://smartticket.herokuapp.com/
