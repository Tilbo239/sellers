//Register User Exception

class EmailAlreadyExistException implements Exception {}

class PhoneExistException implements Exception {}

class InvalidEmailAddressException implements Exception {}

class WeakPasswwordException implements Exception {} //lenght > 6

class InvalidPhoneNumberException implements Exception {}

class InvalidNameException implements Exception {} //lenght >= 5

class InvalidGenderException implements Exception {} //Masculin/Feminin

class InvalidDateException implements Exception {}

//Loign User Exception
class IdentifiantsInvalidesException implements Exception {}

class GenericAuthException implements Exception {}

// class InvalidPhoneNumberException implements Exception {}

class DeleteException implements Exception {}

//General Exception
class UnauthorizedException implements Exception {}

class GeneralException implements Exception {}
