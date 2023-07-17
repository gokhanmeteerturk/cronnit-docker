
# Cronnit-Docker

Cronnit was a free service for making scheduled posts to Reddit.
This is a dockerized version of the same repo.

## Hosting


For `client_id` and `client_secret` you will need to
[create a Reddit app](https://www.reddit.com/prefs/apps) using a callback URL
of `http://localhost:8080/`

Put those two into config.php.example and you can do `docker-compose up` .

## Donate

If you find Cronnit useful as a tool or source please consider
[making a donation](https://cronnit.us/donate)!
