from django.db import models

class Gender(models.TextChoices):
    MALE = 'Male', 'Male'
    FEMALE = 'Female', 'Female'

class Role(models.TextChoices):
    USER = 'User', 'User'
    ADMIN = 'Admin', 'Admin'
    DISPATCHER = 'Dispatcher', 'Dispatcher'
    VOLONTAIRE = 'Volontaire', 'Volontaire'

class BloodGroup(models.TextChoices):
    O_POSITIVE = 'O+', 'O+'
    O_NEGATIVE = 'O-', 'O-'
    A_POSITIVE = 'A+', 'A+'
    A_NEGATIVE = 'A-', 'A-'
    B_POSITIVE = 'B+', 'B+'
    B_NEGATIVE = 'B-', 'B-'
    AB_POSITIVE = 'AB+', 'AB+'
    AB_NEGATIVE = 'AB-', 'AB-'
