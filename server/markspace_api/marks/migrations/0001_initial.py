# Generated by Django 3.1.2 on 2021-02-10 03:37

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('students', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='SubGrade',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('name', models.TextField()),
                ('mark', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Mark',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('grade', models.TextField()),
                ('comment', models.TextField(blank=True)),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='students.student')),
                ('subs', models.ManyToManyField(related_name='the_mark', to='marks.SubGrade')),
            ],
        ),
    ]
