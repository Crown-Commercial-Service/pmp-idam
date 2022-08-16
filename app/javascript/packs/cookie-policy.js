import Cookies from 'js-cookie';

const removeGACookies = () => {
  const cookieList = Object.keys(Cookies.get());
  const gaCookieList = [];
  const cookiePrefixes = ['_ga', '_gi', '_cls'];

  for (let i = 0; i < cookieList.length; i++) {
    const cookieName = cookieList[i];

    if (cookiePrefixes.some((cookiePrefix) => cookieName.startsWith(cookiePrefix))) gaCookieList.push(cookieName);
  }

  gaCookieList.forEach((cookieName) => Cookies.remove(cookieName, { path: '/', domain: '.crowncommercial.gov.uk' }));
};

const updateBanner = (isAccepeted, $newBanner) => {
  Cookies.set('pmp_cookie_settings_viewed', 'true', { expires: 365 });
  Cookies.set('pmp_google_analytics_enabled', isAccepeted, { expires: 365 });
  $('#cookie-options-container').hide();
  $newBanner.show();
};

document.addEventListener('DOMContentLoaded', () => {
  if (Cookies.get('pmp_cookie_settings_viewed') === 'true') $('#cookie-consent-container').hide();
  if (Cookies.get('pmp_google_analytics_enabled') !== 'true') removeGACookies();
});

$(() => {
  $('#accept-all-cookies').on('click', (e) => {
    e.preventDefault();

    updateBanner('true', $('#cookies-accepted-container'));
  });

  $('#update-cookie-setings').on('submit', (event) => {
    event.preventDefault();

    Cookies.set('pmp_cookie_settings_viewed', 'true', { expires: 365 });

    if ($('input[name=ga_cookie_usage]:checked').val() === 'true') {
      Cookies.set('pmp_google_analytics_enabled', 'true', { expires: 365 });
    } else {
      Cookies.remove('pmp_google_analytics_enabled');
      removeGACookies();
    }

    $('#cookie-settings-saved').show();
    $('html, body').animate({ scrollTop: $('#cookie-settings-saved').offset().top }, 'slow');
  });
});
