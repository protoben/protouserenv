/* See LICENSE file for copyright and license details. */
/* vim: expandtab
 */
/* Default settings; can be overrided by command line. */

static Bool topbar = True;                  /* -b  option; if False, dmenu appears at bottom */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"profont:size=8"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *normbgcolor = "#111111"; /* -nb option; normal background                 */
static const char *normfgcolor = "#3399ff"; /* -nf option; normal foreground                 */
static const char *selbgcolor  = "#111111"; /* -sb option; selected background               */
static const char *selfgcolor  = "#ff3399"; /* -sf option; selected foreground               */
static const char *outbgcolor  = "#00ffff";
static const char *outfgcolor  = "#111111";
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static char persist[BUFSIZ]    = "";        /* Nonempty string turns -p mode on by default   */
static unsigned int outmax     = 500;       /* Max lines of output to keep in memory         */
static unsigned int outmin     = 15;        /* Default number of lines for persist mode      */
