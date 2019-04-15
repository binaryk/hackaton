<?php

use App\Models\Auth\User;
use Illuminate\Database\Seeder;

/**
 * Class UserTableSeeder.
 */
class UserTableSeeder extends Seeder
{
    use DisableForeignKeys;

    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        $this->disableForeignKeys();
        User::truncate();

        // Add the master administrator, user id of 1
        User::create([
            'first_name'        => 'Admin',
            'last_name'         => 'Istrator',
            'email'             => 'admin@admin.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Backend',
            'last_name'         => 'User',
            'email'             => 'executive@executive.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Default',
            'last_name'         => 'User',
            'email'             => 'user@user.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Student 1',
            'last_name'         => 'Prenume 1',
            'email'             => 'student1@student.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);


        /*******************************
         ********* TEACHERS ************
         *******************************/

        User::create([
            'first_name'        => 'Simona',
            'last_name'         => 'Arsenov',
            'email'             => 'simona.arsenov@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        /*******************************
         ********* CLASA 9A ************
         *******************************/

        User::create([
            'first_name'        => 'Antone',
            'last_name'         => 'Maria',
            'email'             => 'antone.maria@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Butu',
            'last_name'         => 'Eduard',
            'email'             => 'butu.eduard@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Carlan',
            'last_name'         => 'Alexandra',
            'email'             => 'carlan.alexandra@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Chipurici',
            'last_name'         => 'Victoria',
            'email'             => 'chipurici.victoria@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);


        User::create([
            'first_name'        => 'Chirita',
            'last_name'         => 'Bogdan',
            'email'             => 'chirita.bogdan@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Cojocaru',
            'last_name'         => 'Ana',
            'email'             => 'cojocaru.ana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Dragan',
            'last_name'         => 'Tudor',
            'email'             => 'dragan.tudor@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Dumitrascu',
            'last_name'         => 'Vadim',
            'email'             => 'dumitrascu.vadim@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Eremia',
            'last_name'         => 'Andreea',
            'email'             => 'eremia.andreea@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Florescu',
            'last_name'         => 'Sabina',
            'email'             => 'florescu.sabina@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Georgescu',
            'last_name'         => 'Julia',
            'email'             => 'georgescu.julia@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Gherasim',
            'last_name'         => 'Razvan',
            'email'             => 'gherasim.rasvan@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Ilie',
            'last_name'         => 'Dana',
            'email'             => 'ilie.dana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Iosif',
            'last_name'         => 'Delia',
            'email'             => 'iosif.delia@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Lazar',
            'last_name'         => 'Raluca',
            'email'             => 'lazar.raluca@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Lucinschi',
            'last_name'         => 'Olga',
            'email'             => 'lucinschi.olga@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Moldoveanu',
            'last_name'         => 'Elena',
            'email'             => 'moldoveanu.elena@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Petre',
            'last_name'         => 'Alexandru',
            'email'             => 'petre.alexandru@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Radu',
            'last_name'         => 'Andrei',
            'email'             => 'radu.andrei@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Radulescu',
            'last_name'         => 'Andrei',
            'email'             => 'radulescu.andrei@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Rotea',
            'last_name'         => 'Cristina',
            'email'             => 'rotea.cristina@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Ruxanda',
            'last_name'         => 'Maria',
            'email'             => 'ruxanda.maria@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Sima',
            'last_name'         => 'Maria',
            'email'             => 'sima.maria@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Tasiu',
            'last_name'         => 'Tatiana',
            'email'             => 'tasiu.tatiana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Tanase',
            'last_name'         => 'Maria',
            'email'             => 'tanase.maria@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Trusca',
            'last_name'         => 'Raluca',
            'email'             => 'trusca.raluca@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Vasilescu',
            'last_name'         => 'Matei',
            'email'             => 'vasilescu.matei@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Zurini',
            'last_name'         => 'Leonerdo',
            'email'             => 'zurini.leonardo@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        /*******************************
         ********* CLASA 9B ************
         *******************************/

        User::create([
            'first_name'        => 'Adoc',
            'last_name'         => 'Danu',
            'email'             => 'adoc.danu@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Ardelean',
            'last_name'         => 'Denisa',
            'email'             => 'ardelean.denisa@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Berari',
            'last_name'         => 'George',
            'email'             => 'berari.george@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Borza',
            'last_name'         => 'Alex',
            'email'             => 'borza.alex@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Busui',
            'last_name'         => 'Bogdan',
            'email'             => 'busui.bogdan@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Cionca',
            'last_name'         => 'Paul',
            'email'             => 'cionca.paul@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Cret',
            'last_name'         => 'Alexandru',
            'email'             => 'cret.alexandru@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Damina',
            'last_name'         => 'Melisa',
            'email'             => 'damian.melisa@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Darie',
            'last_name'         => 'Patrick',
            'email'             => 'darie.patrick@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Dascau',
            'last_name'         => 'Andreea',
            'email'             => 'dascau.andreea@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Dumitrescu',
            'last_name'         => 'Iasmina',
            'email'             => 'dumitrescu.iasmina@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Giurgiu',
            'last_name'         => 'Alexandru',
            'email'             => 'giurgiu.alexandru@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Horga',
            'last_name'         => 'Sebastian',
            'email'             => 'horga.sebastian@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Iov',
            'last_name'         => 'Robert',
            'email'             => 'iov.robert@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Jurj',
            'last_name'         => 'Diana',
            'email'             => 'jurj.diana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Koteles',
            'last_name'         => 'Patrick',
            'email'             => 'koteles.patrick@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Kovacs',
            'last_name'         => 'Patric',
            'email'             => 'kovacs.patrick@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Mircea',
            'last_name'         => 'Sebastian',
            'email'             => 'mircea.sebastian@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Moraru',
            'last_name'         => 'Ovidiu',
            'email'             => 'moraru.ovidiu@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Nasui',
            'last_name'         => 'Elisa',
            'email'             => 'nasui.elisa@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Ruja',
            'last_name'         => 'Roxana',
            'email'             => 'ruja.roxana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Sida',
            'last_name'         => 'Ioana',
            'email'             => 'sida.ioana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Stanescu',
            'last_name'         => 'Ana Maria',
            'email'             => 'stanescu.ana.maria@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Streanga',
            'last_name'         => 'Eduard',
            'email'             => 'streanga.eduard@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Toderici',
            'last_name'         => 'Mihai',
            'email'             => 'toderici.mihai@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Vanya',
            'last_name'         => 'Iulia',
            'email'             => 'vanya.iulia@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        /*******************************
         ********* CLASA 10A ************
         *******************************/

        User::create([
            'first_name'        => 'Aron',
            'last_name'         => 'Raluca',
            'email'             => 'aron.raluca@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Bloboli',
            'last_name'         => 'Dominik',
            'email'             => 'blaboli.dominik@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Bornea',
            'last_name'         => 'Andra',
            'email'             => 'bornea.andra@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Brita',
            'last_name'         => 'Catalin',
            'email'             => 'brita.catalin@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Chesa',
            'last_name'         => 'Razvan',
            'email'             => 'chesa.razvan@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Csaky',
            'last_name'         => 'Carina',
            'email'             => 'csaky.carina@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'De Marco',
            'last_name'         => 'Alexia',
            'email'             => 'marco.alexia@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Deffert',
            'last_name'         => 'Cristina',
            'email'             => 'deffert.cristina@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Gancea',
            'last_name'         => 'Ioana',
            'email'             => 'gancea.ioana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);


        User::create([
            'first_name'        => 'Gyarmathy',
            'last_name'         => 'Andrei',
            'email'             => 'gyarmathy.andrei@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Havran',
            'last_name'         => 'Victor',
            'email'             => 'havran.victor@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Lucaci',
            'last_name'         => 'David',
            'email'             => 'lucaci.david@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Lupas',
            'last_name'         => 'Victor',
            'email'             => 'lupas.victor@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Marin',
            'last_name'         => 'Maria',
            'email'             => 'marin.maria@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Mihai',
            'last_name'         => 'Alexia',
            'email'             => 'mihai.alexia@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Neamt',
            'last_name'         => 'Diana',
            'email'             => 'neamt.diana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Pirv',
            'last_name'         => 'Ioana',
            'email'             => 'pirv.ioana@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Roman',
            'last_name'         => 'Paula',
            'email'             => 'roman.paula@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Tanasescu',
            'last_name'         => 'Emma',
            'email'             => 'tanasescu.emma@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Toader',
            'last_name'         => 'Sebastian',
            'email'             => 'toader.sebastian@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Ungur',
            'last_name'         => 'Radu',
            'email'             => 'ungur.radu@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        User::create([
            'first_name'        => 'Vonica',
            'last_name'         => 'Iulia',
            'email'             => 'vonica.iulia@gmail.com',
            'password'          => 'secret',
            'confirmation_code' => md5(uniqid(mt_rand(), true)),
            'confirmed'         => true,
        ]);

        $this->enableForeignKeys();
    }
}
