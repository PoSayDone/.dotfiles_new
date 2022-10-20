import pywalQute.draw

config.load_autoconfig()

pywalQute.draw.color(c, {
    'spacing': {
        'vertical': 10,
        'horizontal': 10,
    }
})

c.window.transparent = True
c.colors.tabs.bar.bg = "#00000000"

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!a':       'https://www.amazon.com/s?k={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!dd':      'https://thefreedictionary.com/{}',
    '!e':       'https://www.ebay.com/sch/i.html?_nkw={}',
    '!fb':      'https://www.facebook.com/s.php?q={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!gist':    'https://gist.github.com/search?q={}',
    '!gi':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    '!gn':      'https://news.google.com/search?q={}',
    '!ig':      'https://www.instagram.com/explore/tags/{}',
    '!m':       'https://www.google.com/maps/search/{}',
    '!p':       'https://pry.sh/{}',
    '!r':       'https://www.reddit.com/search?q={}',
    '!sd':      'https://slickdeals.net/newsearch.php?q={}&searcharea=deals&searchin=first',
    '!t':       'https://www.thesaurus.com/browse/{}',
    '!tw':      'https://twitter.com/search?q={}',
    '!w':       'https://en.wikipedia.org/wiki/{}',
    '!yelp':    'https://www.yelp.com/search?find_desc={}',
    '!yt':      'https://www.youtube.com/results?search_query={}'
}

c.tabs.padding = {"bottom": 13, "left": 10, "right": 10, "top": 13}

c.url.start_pages = 'file:///home/posaydone/.config/bspwm/startpage/index.html'
c.url.default_page = 'file:///home/posaydone/.config/bspwm/startpage/index.html'
c.fonts.default_family = 'SF Pro Display'

c.fonts.tabs.selected = "500 default_size default_family"
c.fonts.tabs.unselected = "400 default_size default_family"

c.content.local_content_can_access_remote_urls = True
c.scrolling.smooth = True
c.qt.workarounds.remove_service_workers = True

old_chrome_ua = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/67.0.1 Safari/{webkit_version}'

config.set('content.headers.user_agent', old_chrome_ua, 'steamdb.info')
config.set('content.headers.user_agent', old_chrome_ua, 'forum.xda-developers.com')
config.set('content.headers.user_agent', old_chrome_ua, 'www.nginx.com')
config.set('content.headers.user_agent', old_chrome_ua, 'gitlab.com/users/sign_in')
config.set("input.mode_override", "passthrough", "docs.google.com")
config.set("input.mode_override", "passthrough", "programforyou.ru")
config.set("input.mode_override", "passthrough", "eduhseru-my.sharepoint.com")

config.unbind('.')
en_keys = "qwertyuiop[]asdfghjkl;'zxcvbnm,./"+'QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?'
ru_keys = 'йцукенгшщзхъфывапролджэячсмитьбю.'+'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,'
c.bindings.key_mappings.update(dict(zip(ru_keys, en_keys)))
