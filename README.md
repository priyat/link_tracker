# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 3.2.2

* Rails version - 7.0.8.1

* APIs
1. As a Sideqik Client, I want to provide my store URL and have the API respond with a random tracking link.
Input: store_url
Output: Random tracking code

POST: http://localhost:3000/links

Request Body:
{
	"store_url": "http://www.testingmcafeesites.com/index.html"
}

Response Body:
{
    "id": 1,
    "creator": null,
    "store_url": "http://www.testingmcafeesites.com/index.html",
    "tracking_code": "6f3d999b",
    "visit": null,
    "created_at": "2024-04-23T18:05:33.495Z",
    "updated_at": "2024-04-23T18:05:33.495Z"
}


2. As a Consumer, I want to visit a tracking link and have the system redirect me to the proper store URL.
3. As a Sideqik Client, I want the system to track the number of visits to each tracking link.

Above 2 user stories has been covered in same API.
Input: store_url
Output: Redirect to store URL

GET: http://localhost:3000/6f3d999b

Response: Will be redirected to store URL.

4. As a Sideqik Client, I want to retrieve the tracking data for a single tracking link.
Input: tracking_code
Output: Tracking data (Returns entire link data)

GET: http://localhost:3000/links/6f3d999b

Response:
{
    "id": 1,
    "creator": null,
    "store_url": "http://www.testingmcafeesites.com/index.html",
    "tracking_code": "6f3d999b",
    "visit": 3,
    "created_at": "2024-04-23T18:05:33.495Z",
    "updated_at": "2024-04-23T18:05:33.495Z"
}