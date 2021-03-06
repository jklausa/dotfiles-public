# vim: set noexpandtab:
use vars qw($VERSION %IRSSI);
$VERSION = "5.3";
%IRSSI = (
        authors     => "Simon 'simmel' Lundstr�m",
        contact     => 'simmel@(freenode|quakenet|efnet) http://last.fm/user/darksoy',
        name        => "lastfm",
        date        => "20091124",
        description => 'A now-playing-script which uses Last.fm',
        license     => "BSD",
        url         => "http://soy.se/code/",
);
# USAGE
# For details on how to use each setting, scroll down to the SETTINGS section.

# QUICK START
# * First of all, you need the libwww/LWP package installed. The package in
# your package system is probably called something with libwww and perl and/or
# p5 in it.
# * /set lastfm_user to the username that you are using on Last.fm
# * Show with /np or %np<TAB> what song "lastfm_user" last scrobbled to Last.fm via /say. If "lastfm_use_action" is set, it uses /me.
# * To see what another user on Last.fm is playing is also possible via /np <username> or %np(<username>).
# The now-playing message is configurable via via "lastfm_output" (and lastfm_output_tab_complete when using %np, if not set it will use lastfm_output by default.). "lastfm_strftime" can be used to configure the display of date and time when the song was scrobbled.

# SETTINGS
# NOTE: Do not set these options here, use /set <option> <value> in irssi!
# These are just defaults and descriptions on what the options do.

# The username which you are using on Last.fm
Irssi::settings_add_str("lastfm", "lastfm_user", "");

# The output that you want to use.
# The substitution variables are:
#   %artist = Self explanatory
#   %album  = Self explanatory
#   %name   = Name of song*
#   %url    = URL to song on Last.fm
#   %player = Player we are using to submit to Last.fm with See setting "lastfm_get_player" below
# If "lastfm_output_tab_complete" is not defined, "lastfm_output" will be used instead.
# Something bothered me for a long time and when something really starts to itch
# I tend to want to do something about it. I'm /np:ing away displaying all sorts
# of tracks to my friends until I get to a track which has no album information
# on Last.fm and the output becomes really ugly "np: Kraftwerk-Aerodynamik 
# (Alex Gopher/Etienne de Crecy dynamik mix) ()". What's with that last ()!? Oh,
# right we are using "np: %artist-%name (%album)" as "lastfm_output". Wouldn't 
# it be really cool if lastfm.pl knew when certain information from Last.fm
# didn't exist and didn't display it? So thought I, so that's why I created a 
# conditional. It works that you have to put your tag (%album e.g.) within %()
# e.g. "np: %artist-%name%( (%album))" and everything between %( and ) only gets
# displayed if the tag inside actually exists! Cool, huh!?

#  *) Name is used instead of, the more logical IMO, track since that is what Last.fm reports in their .xml file that we parse.
Irssi::settings_add_str("lastfm", "lastfm_output", 'np: %artist-%name');
Irssi::settings_add_str("lastfm", "lastfm_output_tab_complete", '');

# If we should use /me instead of /say
Irssi::settings_add_bool("lastfm", "lastfm_use_action", 0);

# If we should make the subtitution variable %player available which is very slow to fetch but nice to have.
Irssi::settings_add_bool("lastfm", "lastfm_get_player", 0);

# Changelog#{{{

# 5.3 -- 
# * I used POSIX::_exit() but I never did "use POSIX;". Leo Green, mortiis and
# rissy reported this problem, thanks! This is an issue when you have a newer
# version of Perl installed (>5.10)

# 5.2 -- Mon Nov 16 08:25:20 CET 2009
# * When you remove a subroutine you should remove all calls to it..

# 5.1 -- Wed Nov 11 09:39:54 CET 2009
# * Ok, I admit that using undocumented features in an API is bad, but come
# on..  Anyway, fixed now, everything should work as it should and should
# never break again (flw)...

# 5.0 -- Mon Nov 9 08:34:48 CET 2009
# * Fixed a warning reported by mm_mannen and did a yet another clean up

# 4.9 -- Sat Nov 7 18:10:17 CET 2009
# * Last.fm changed how their API behaved and that broke my code because
# I'm a fool and I don't want to use an XML-lib because of your sake (so you
# won't have to install yet another Perl-module). Thanks to supertobbe and 
# mm_mannen who saw and reported this!
# * Fixed so that lastfm_get_player works again and made it say that it
# doesn't work next time Last.fm changes their HTML.
# * Removed the date support in lastfm_output and lastfm_output_tab_complete
# since I use the API another way now.
# * Removed cache. It was broken at times and I can't be arsed to debug it.
# It's not that much faster but the complexity gets bigger. If someone REALLY
# needs this, give me a shout.
# * Removed, rewrote and cleaned up some parts of the script.

# 4.8 -- Sun May 10 10:11:29 CEST 2009
# * Fixed a bug with the cache ('There are only two hard things in 
# Computer Science: cache invalidation and naming things' -Phil Karlton)
# * Started using HTML::Entities for decoding all sorts of HTML-chars, it's 
# included in libwww anyway.

# 4.7 -- Tue Apr  8 13:37:11 CEST 2009
# * Start using LWP::UserAgent instead of LWP::Simple and got rid of the idea to
# start using my own HTTP-lib (it was finished, but..). I'm getting old ; P
# * Made so that everything is cached and checks if the Last-Modified date when 
# getting information from Last.fm.
# * Fixed some documentation bugs.

# 4.6 -- Wed Mar 18 19:45:11 CET 2009
# * Fixed an changed behavour in irssi-trunk with the error handling (which I should replace anyway!).
# * Added %player substitute variable that shows what application you are using to scrobble with. This is very slow, so I made it an option, "lastfm_get_player".
# * Fixed print_raw once and for all (famous last words..) so now debug output looks really neat.
# * Added an quick start which should help get going faster
# * Fixed an issue where %np(lastfmusername) would not work.
# * Fixed error mesages for %np(lastfmusername)
# * Fixed an problem with irssi-svn where die's message have changed. Thanks tto jnpplf  for reporting this.

# 4.5 -- Wed  1 Oct 2008 20:03:47 CEST
# * Removed a debug output
# * Fixed some datacorruption, references in Perl is hard! = (

# 4.4 -- Wed  1 Oct 2008 16:34:34 CEST
# * Changed so that all the tab-commands use % instead of $ so that it's consistent through out the script.
# * Ripped out my sprintf crap and made it more sane. You should use %artist, %album, etc in your nowplaying-setting now. Since sprintf is nolonger used I renamed that setting too.
# * Made everything that you can set in "lastfm_output" tabable so now you can do %artist<TAB>.
# %() in "lastfm_output" really works. It really didn't before.
# * Fixed some issues with the date probably not working, but should now.
# * Made the script check if Last.fm's scrobbler server is alive and kicking before we blame them.

# 4.3 -- Mon 21 Jul 2008 08:46:36 CEST
# * Seem like I misunderstood the protocol. The date/time is only sent when we have scrobbled the track, not when we started to listen to it.

# 4.2 -- Tue 15 Jul 2008 15:40:08 CEST
# Yay! Three new version within a day! (No, I'm not bored at work)
# * Made /np username and $np(username) make username the prefix of np: yadayada or whatever your lastfm_sprintf or lastfm_sprintf_tab_complete is.

# 4.1 -- Tue 15 Jul 2008 15:23:03 CEST
# Well, that version lasted long!
# * Fixed a bug with /np not working.
# * Fixed an issue where debug info would be printed even if lastfm_debug was off.

# 4.0 -- Tue 15 Jul 2008 10:17:51 CEST
# * Fixing a sprintfng-bug which didn't display time if album was not set.
# * Rewrote the whole script to use Last.fm's API which is very accurate. There is no need for $np! and /np! now, so I'm removing them.
# * Cleaned up abit.

# 3.9 -- Fri 11 Jul 2008 21:49:20 CEST
# * Fixing a few bugs noticed by supertobbe

# 3.8 -- Fri 11 Jul 2008 18:21:52 CEST
# * Shaped up error handling and now all error messages are shown.
# * Added a user configurable debug mode, good for sending in bugs and weird behaviour.
# * Minor cleanup

# 3.7 -- Thu 22 May 2008 10:33:55 CEST
# * Fixed so that /np! and $np! fetches the album title too. This is horribly slow and takes approx. 6s on very fast connection. Last.fm isnt very fast I'm afraid and this is not a good way to do it.
# * Cleaned up a few places. Started to look at the error handling and it seems to be alot of work.

# 3.6 -- Tue Nov 13 15:22:37 CET 2007
# * Fixed encoding so that it always the data into the charset that you have specified in "term_charset" which irssi also uses.

# 3.5 -- Mon Nov 12 11:50:46 CET 2007
# * Fixed the regex for parsing Recently Listened Tracks so that it works when listening with the Lastfm client.

# 3.4 -- Fri Nov  9 00:23:40 CET 2007
# * Added /np lastfmusername

# 3.3 -- Tue Nov  6 01:54:59 CET 2007
# * Finally added conditional sprintf-syntax! Let's say you want to use 'np: %s-%s (%s)' as "lastfm_sprintf". If you use /np it works out fine and displays 'np: Boards of Canada-Energy Warning (Geogaddi)' but what if you use /np! then it displays 'np: Boards of Canada-Energy Warning ()' since /np! can't get the album information. Doesn't that look ugly? Meet conditional sprintf. Now set your "lastfm_sprintf" to 'np: %s-%s%( (%s))'. ' (%s)' will only be printed if we get a third value, the album name in this case. Smart, huh? Big thanks to rindolf, apeiron and Khisanth from #perl@freenode for help with scoping with global variables.
# * Also added "lastfm_sprintf_tab_complete" which makes, if set, $np<TAB> use a different sprintf pattern than /np. Will default back to "lastfm_sprintf".

# 3.2 -- Wed Oct 24 23:07:01 CEST 2007
# * I don't like dependencies and I really wonder why I lastfm depended on DateTime. I remember now that it was morning and I was really tired when I coded it. Anyway, it's removed now along with Socket and URI::Escape. I'll try to remove the dependency for libwww later on.

# 3.1 -- Sun Oct 21 22:52:36 CEST 2007
# * Added /np! and $np! to use the "lastfm_be_accurate_and_slow" method without having to change the setting.

# 3.0 -- Fri Oct 19 14:26:03 CEST 2007
# * Created a new setting "lastfm_be_accurate_and_slow" which makes lastfm.pl parse your profile page to check what song you are playing right now. But be warned, this is slow and horrible (like my code! ; ). But it works until Last.fm makes this data available through their Web Services. This disables the album and "scrobbled at" features of "lastfm_sprintf" so you have to adapt it if you don't want it to look weird. I'm working on a new implementation of printf which allows for conditions but it took more time than I thought and time is something that I don't have much of ='(

# 2.5 -- Tue Oct  9 11:29:56 CEST 2007
# * Fixed the encoding issue by converting from Last.fms UTF-8 into Perls internal encoding. With $np<TAB> output will be looking UTF-8-in-latin1 if you don't have an UTF-8 enabled Terminal, but it will display correctly after you have sent it.

# 2.4 -- Mon Oct  8 16:08:09 CEST 2007
# * Fixed an error in error reporting ; P Bug noticed by supertobbe = *
# * I should make an more generic and better error reporting.

# 2.3 -- Sat Oct  6 16:38:34 CEST 2007
# * Made /np a nonblocking operation. Irssi's fork handling is REALLY messy. Thanks to tss and tommie for inspiring me in their scripts. $np cannot be made nonblocking, I'm afraid (patches welcome).
# * Cleaned up abit.

# 2.2 -- Sat Aug 18 02:20:44 CEST 2007
# * Now you can use $np(darksoy) to see what I play (or someone else for that matter ; ).

# 2.1 -- Tue Jul 17 12:50:18 CEST 2007
# * Now you can use $np or $nowplaying as a tab-completion too, but a warning here, this is a blocking action so irssi won't respond or be usable until it is finished or the timeout is hit.
# * Abstracted it abit more so that it can be used in more ways, ex. for the reason above.

# 2.0 -- Fri Jun 29 10:38:32 CEST 2007
# * Now you can show the time that the song was submitted in lastfm_sprintf. Added lastfm_strftime to configure how the date is presented.
# * Added $lastfm and $lfm as tab-completions to your own Last.fm profile URL. Ripoff of Jured's guts.pl (http://juerd.nl/irssi/)

# 1.5 -- Sat May 12 03:30:24 CEST 2007
# * Started using XML instead because we get more info from it, like album (but it's often wrong).

# 1.0 -- Thu Apr 12 16:57:26 CEST 2007
# * Got fedup with no good Last.fm-based now playing scripts around.

# THANKS
# Random individuals on #perl@freenode, could namedrop icke, 
# }}}

# TODO
# You tell me!

# Move along now, there's nothing here to see.

sub DEBUG {
	Irssi::settings_add_bool("lastfm", "lastfm_debug", 0);
	Irssi::settings_get_bool("lastfm_debug");
};

use strict;
no strict 'refs';
use warnings;
use LWP::UserAgent;
use HTML::Entities;
use Irssi;
use Encode;
use Data::Dumper;
use POSIX '_exit';

my $errormsg_pre = "You haven't submitted a song to Last.fm";
my $errormsg_post = ", maybe Last.fm submission service is down?";
our ($pid, $input_tag, %cache) = undef;
our $api_key = "eba9632ddc908a8fd7ad1200d771beb7";
our $fields = "(artist|name|album|url|player)";
our $ua = LWP::UserAgent->new(agent => "lastfm.pl/$VERSION", timeout => 10);

sub cmd_lastfm {
	my ($data, $server, $witem) = @_;
	lastfm_forky($witem, $data);
}

sub lastfm {
		my ($content, $url, $response, $tag, $value, %data); 
		my $user_shifted = shift;
		my $user = $user_shifted || Irssi::settings_get_str("lastfm_user");
		my $is_tabbed = shift;
		my $nowplaying = shift || ((Irssi::settings_get_str("lastfm_output_tab_complete") ne "" && $is_tabbed) ? Irssi::settings_get_str("lastfm_output_tab_complete") : Irssi::settings_get_str("lastfm_output"));

		my $command_message = ($is_tabbed) ? '$np(username)' : '/np username';
		die("You must /set lastfm_user to a username on Last.fm or use $command_message") if $user eq '';

		$url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=$user&api_key=$api_key&limit=1";
		print Dumper "Checking for scrobbles at: $url" if DEBUG;
		$response = $ua->get($url);
		$content = $response->content;

		# TODO This should work, untested (fail more Last.fm! ; )
		die $1 if ($content =~ m!<lfm status="failed">.*<error .*?>([^<]+)!s);
		my @data = split('\n', $content);

		if (!grep(m!<track nowplaying="true">!, @data)) {
			print Dumper \$response if DEBUG;
			die "You are not playing anothing according to Last.fm. Check http://www.last.fm/user/$user and see if they turn up there, otherwise restart your scrobbler.";
		}

		my $regex = qr!<$fields.*?(?:uts="(.*?)">.*?|>(.*?))</\1>!;

		foreach my $data (@data) {
			if ($data =~ m!</track>!) {
				last;
			}
			elsif ($data =~ /$regex/) {
				($tag, $value) = ($1, (defined($2) ? $2 : $3));
				print Dumper \$tag, \$value, \$data if DEBUG;
				$data{$tag} = $value;
			}
		}

		if (Irssi::settings_get_bool("lastfm_get_player")) {
			$url = "http://www.last.fm/user/$user";
			$content = $ua->get($url)->content;
			if ($content =~ m!<div class="scrobblesource">.*?Listening now using (.*?)</div>!) {
				$_ = $1;
				s/<[^>]*>//mgs;
				$data{'player'} = $_;
			}
			else {
				print "Couldn't find the player even though lastfm_get_player was set" if DEBUG;
			}
		}

		print Dumper \%data if DEBUG;
		print Dumper "Output pattern before: $nowplaying" if DEBUG;
		$nowplaying =~ s/(%\((.*?%(\w+).?)\))/($data{$3} ? $2 : "")/ge;
		print Dumper "Output pattern after: $nowplaying" if DEBUG;
		$nowplaying =~ s/%$fields/$data{$1}/ge;
		decode_entities($nowplaying);
		Encode::from_to($nowplaying, "utf-8", Irssi::settings_get_str("term_charset"));
		$nowplaying = "$user_shifted $nowplaying" if $user_shifted;
		return $nowplaying;
}

sub lastfm_forky {
	my $witem = shift;
	my $user = shift || 0;
	my @user = split(/ /, $user);
	$user = $user[0];
	if ($pid or $input_tag) {
		Irssi::active_win()->print("We're still waiting for Last.fm to return our data or to hit the timeout (this happends when Last.fm is down or very slow).");
		return;
	}

	my ($reader, $writer);
	pipe($reader, $writer);
	$pid = fork();
	if (!defined $pid) {
		close $reader;
		close $writer;
		return;
	}
	if ($pid > 0) {
		close $writer;
		Irssi::pidwait_add($pid);
		my @args = ($witem, $reader);
		$input_tag = Irssi::input_add(fileno($reader), INPUT_READ, \&input_read, \@args);
		return;
	}
	my $response;
	eval {
		$response = lastfm($user);
	};
	if ($@) {
		$response = $@;
	}
	print $writer $response;
	close $writer;
	POSIX::_exit(1);
}

sub input_read {
	my ($witem, $reader) = @{$_[0]};
	my @content = <$reader>;
	my $content = join('', @content);

	if ($content =~ /^(.+) at (.*?\/lastfm.pl|\(eval \d+\)) line \d+\.$/) {
		my $message = $1;
		Irssi::active_win()->print($message);
	}
	else {
		if (defined $witem->{type} && $witem->{type} =~ /^QUERY|CHANNEL$/) {
			if (Irssi::settings_get_bool("lastfm_use_action")) {
				$witem->command("me $content");
			}
			else {
				$witem->command("say $content");
			}
		}
		else {
			print($content);
		}
	}

	Irssi::input_remove($input_tag);
	close $reader;
	$input_tag = $pid = undef;
}

Irssi::command_bind('np', 'cmd_lastfm', 'lastfm');

Irssi::signal_add_last 'complete word' => sub {
	my ($complist, $window, $word, $linestart, $want_space) = @_;
	my $is_tabbed = 1;
	my $tab_fields = $fields;
	$tab_fields =~ s/\(/(nowplaying|np|/;
	if ($word =~ /%(lastfm|lfm)/) {
		my $user = Irssi::settings_get_str("lastfm_user");
		if (!defined $user) {
			Irssi::active_win()->print("You must /set lastfm_user to a username on Last.fm");
			return;
		}
		push @$complist, "http://last.fm/user/$user/";
	}
	elsif ($word =~ /(\%(?:$tab_fields))\(?(\w+)?\)?/) {
		my ($nowplaying, $user) = ($1, $3);
		undef $nowplaying if ($nowplaying =~ /nowplaying|np/);
		eval {
			$nowplaying = lastfm($user, $is_tabbed, $nowplaying);
		};
		if ($@) {
			if ($@ =~ /^(.+) (.*?\/lastfm.pl|\(eval \d+\)) line \d+\.$/) {
				my $message = $1;
				Irssi::active_win()->print($message);
			}
			return 0;
		}
		push @$complist, "$nowplaying" if $nowplaying;
	}
};
