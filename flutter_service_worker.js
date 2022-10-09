'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "0af5912d90ecc2dfe198ef2146d9295a",
"index.html": "61a8a6d14f0e8cf6eb01eed53a800944",
"/": "61a8a6d14f0e8cf6eb01eed53a800944",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"manifest.json": "a9a691f577b738a338984baa873307b0",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"assets/AssetManifest.json": "3b18bf73956bcdb175256e4933e8d216",
"assets/shaders/ink_sparkle.frag": "237ceacd6c04871e538aaa934b1327a3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "076a0461b0b2fbb5ea4a0328fd8a9406",
"assets/assets/images/chat_account_default.svg": "72a27299f58cc78f883b56759a449f24",
"assets/assets/images/moon.png": "ecb8d1992acadd681234dd4a0420d9f5",
"assets/assets/images/gallery.svg": "e2a053914881a2c7a32a305046826b31",
"assets/assets/images/camera.svg": "fcf0db9b683c06575a2eb6bb8d235cb8",
"assets/assets/images/astronaut.png": "5c0fb29c009f02bab32425a98d304010",
"assets/assets/images/splash_logo.svg": "338143c5933cf0cd5ab8950d73dda33e",
"assets/assets/images/ribbons.svg": "29f80725c7f39660d0cc338d7accf854",
"assets/assets/fonts/rail-grotesk-regular.ttf": "c6a93fc1d1539a463c2d5bd25df670a3",
"assets/assets/icons/money.svg": "0ce839dea9ce827233349dc022ee1157",
"assets/assets/icons/search_selected.svg": "d21b016184b2ce211d162baa2a2b6a09",
"assets/assets/icons/comment.svg": "6b775997c51531b9c4586c48be99ecf8",
"assets/assets/icons/home_unselected.svg": "ba50b94fd49288c7916806177430f27e",
"assets/assets/icons/heart-digit41.svg": "f911b3bed5be832cc073f0c8e6bab2b9",
"assets/assets/icons/add_post_selected.svg": "3dc8b9e1ccfe33844d92d2dd7ff1225b",
"assets/assets/icons/chat_reply.svg": "60fd0643306978ab0358d006edb12ba5",
"assets/assets/icons/add_post_unselected.svg": "4db938d5a247d4cec760d957c673af19",
"assets/assets/icons/chat_menu.svg": "218f33b2f726ca8132794fdd3ef2518f",
"assets/assets/icons/attachment.svg": "ff8652fddf94aa613000111601799c94",
"assets/assets/icons/small-black-digit41.svg": "5ccd599eeee5ba9bee6dfa8b7fce9fa4",
"assets/assets/icons/verify.svg": "2964ec31c26192b7b0ca89f6e795eb6b",
"assets/assets/icons/bell-notification-alarm.svg": "c9861fe92fa52135c73c551bc9f1c055",
"assets/assets/icons/lock.svg": "cd95d873e063db26926a90701f20eb58",
"assets/assets/icons/message_selected.svg": "124fcd695843be58061fe0957800ca3f",
"assets/assets/icons/send_message_txt.svg": "bb6538d67ccf142a96a20c8d711cdfce",
"assets/assets/icons/search_unselected.svg": "94c7878c8fd8304f56ea7bf594a6f853",
"assets/assets/icons/message_unselected.svg": "54119e617f3e8eec70fd4923f2205f4e",
"assets/assets/icons/setting.svg": "fb5ed3a16a2cc8544ed83c61f15e3084",
"assets/assets/icons/unlock.svg": "ff646881af18d7e83f1391605c457e48",
"assets/assets/icons/account_selected.svg": "377892b3101af7295edff8e3ddb65307",
"assets/assets/icons/like.svg": "cfe6021f45142e04b594a56c3dccc7c2",
"assets/assets/icons/box.svg": "bba3413b09835b1946fcaa0f4403b92a",
"assets/assets/icons/chat_msg_sent.svg": "440deb29fc906d6a4f299eb284cfb56a",
"assets/assets/icons/home_selected.svg": "0e1d02a38775192eacbb867e2f42e92c",
"assets/assets/icons/fav.svg": "deff4185ff465a971f7fb32ae93ddaf4",
"assets/assets/icons/chat_msg_seen.svg": "892c1ac9742dab8d118b45d7fd431b96",
"assets/assets/icons/account_unselected.svg": "1afbc99e876ce3fb6e77770a02d7b815",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "afbd1728c5dff2ce4dcceabd7bf2432b",
"version.json": "5515f7afaebf7f2c2f816d44c2a1079f",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
