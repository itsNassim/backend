from django.db import models
from .enums import Gender, Role, BloodGroup

class Person(models.Model):
    first_name = models.CharField(max_length=50, null=False)
    last_name = models.CharField(max_length=50, null=False)
    username = models.CharField(max_length=50, unique=True, null=False)
    password = models.CharField(max_length=50, null=False)
    phone_number = models.CharField(max_length=20, null=False)
    email = models.EmailField(blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    gender = models.CharField(max_length=10, choices=Gender.choices, null=False)
    date_of_birth = models.DateField()
    role = models.CharField(max_length=20, choices=Role.choices, null=False)

    class Meta:
        verbose_name = "Person"
        verbose_name_plural = "People"

class Diseases(models.Model):
    name = models.CharField(max_length=100)

    class Meta:
        verbose_name = "Disease"
        verbose_name_plural = "Diseases"

class User(models.Model):
    person = models.OneToOneField(Person, on_delete=models.CASCADE, primary_key=True)
    blood_group = models.CharField(max_length=3, choices=BloodGroup.choices, blank=True, null=True)
    number_of_warnings = models.IntegerField(default=0)
    number_of_bans = models.IntegerField(default=0)
    last_connection_date = models.DateTimeField(blank=True, null=True)
    registration_date = models.DateField(auto_now_add=True)

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"

class UserDiseases(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    disease = models.ForeignKey(Diseases, on_delete=models.CASCADE)

class EmergencyContact(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=20)
    relationship = models.CharField(max_length=50)

    class Meta:
        verbose_name = "Emergency Contact"
        verbose_name_plural = "Emergency Contacts"

class Admin(models.Model):
    person = models.OneToOneField(Person, on_delete=models.CASCADE, primary_key=True)

class Dispatcher(models.Model):
    person = models.OneToOneField(Person, on_delete=models.CASCADE, primary_key=True)

class Volontaire(models.Model):
    person = models.OneToOneField(Person, on_delete=models.CASCADE, primary_key=True)
