# Breaking Bad Swift Application

## Further Development
If I had more time to develop this application I would work on the following:

Include proper error handling.
- Implement pull to refresh.
- Make the app look nicer design wise.
- Add more information and UI to the detail screens.
- Add more unit tests.

Other things to consider:

- Pass the relevant ID instead of the model from the list screen to detail screen. For example with the Character list, we take the id and pass it through the CharacterViewModel. Then use this ID to make the network call to get information for that specific Character.
- We could also use coordinators for showing the detail screens so that it would be testable.
