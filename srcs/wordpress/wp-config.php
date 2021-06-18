<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://ru.wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */


#mysql
// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */

define( 'DB_NAME', 'wordpress_db' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'fflores' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'fflores' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'mysql' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8' );
#mysql

#phpmyadmin
define('WP_HOME', 'http://192.168.99.100:5050' );

define('WP_SITEURL', 'http://192.168.99.100:5050' );
#phpmyadmin

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'q{#odtSC-wr$[kylEt C-P U*w3NK{`E8A^1B<V-/lP |Iz~_+@V+#>P~|/$e=TQ');
define('SECURE_AUTH_KEY',  'Go{J29i_2b(k.%[G-#I%SO*-w:b^TH+($J(wb^+b%ek4Z:SgCvUZ3ydF<W=kc|(q');
define('LOGGED_IN_KEY',    '^Mr8[@V)O,ZT6$!Bg&hH7qrQ|-22-WIE{u+<DNmS~<<=P,Uu++XLpC_1(Sfw}>CB');
define('NONCE_KEY',        'M`55r-k+L|M|$R>nV6Z0P{;DAQtg)=!.)GWZ]5f2G/-AL6CRVz,LWJu1Z3.fZT&F');
define('AUTH_SALT',        'v&a3L54i%Etlyb11w3NZ@n7%}`;l<5 ik!8w]-~)cJ@7#UhP_rD]/wUTm3k-fh,_');
define('SECURE_AUTH_SALT', 't8B.~_k{?O2tu@>%O0,Qb0q5.7L8=2JZkiU#N/_Rhp}lqulFZkm0FQoSw:rEY4my');
define('LOGGED_IN_SALT',   'wqsr$J`pT~G6nDwVTK[P0S4C8[tB1Wh@`l+Y2MO75sUAHkc]B{wKtGbq-+0]4UWe');
define('NONCE_SALT',       '}&<L.V<u`+tmOI7)i`qevL:;;:?J-EV8c8$,Nh(p/_rR#QH_O7&67OUqp]6#kI{5');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в документации.
 *
 * @link https://ru.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once ABSPATH . 'wp-settings.php';