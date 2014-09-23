REST API Documentation
======================



In order to use it on your server you have to do some minor changes in a few paths and urls.


1st. Change the url parameter in swagger-ui/dist/index.html file. This parameter should point to a resource listing url (e.g. mylocalhost.com/api/api-docs).

2nd. Set a basepath that points to the server where you are going to do the url requests. You can find it in the configuration.yaml file.


You can find the json files that we use to describe the api resources in the api/v1 folder.
