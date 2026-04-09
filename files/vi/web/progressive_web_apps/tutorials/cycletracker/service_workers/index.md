---
title: "CycleTracker: Service worker"
short-title: Hỗ trợ ngoại tuyến bằng service worker
slug: Web/Progressive_web_apps/Tutorials/CycleTracker/Service_workers
page-type: tutorial-chapter
sidebar: pwasidebar
---

{{PreviousMenu("Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}

Cho đến đây, chúng ta đã viết HTML, CSS và JavaScript cho CycleTracker. Chúng ta đã thêm manifest file định nghĩa màu sắc, biểu tượng, URL và các tính năng khác của ứng dụng. Chúng ta đã có một PWA hoạt động! Nhưng nó vẫn chưa hoạt động ngoại tuyến. Trong phần này, chúng ta sẽ viết JavaScript cần thiết để biến ứng dụng web đầy đủ chức năng của mình thành một PWA có thể được phân phối như một ứng dụng độc lập và hoạt động trơn tru khi ngoại tuyến.

Nếu bạn chưa làm, hãy sao chép file JSON [HTML](https://github.com/mdn/pwa-examples/blob/main/cycletracker/manifest_file/index.html), [CSS](https://github.com/mdn/pwa-examples/blob/main/cycletracker/manifest_file/style.css), [JavaScript](https://github.com/mdn/pwa-examples/blob/main/cycletracker/manifest_file/app.js) và [manifest](https://github.com/mdn/pwa-examples/blob/main/cycletracker/manifest_file/cycletracker.json). Lưu chúng thành các file `index.html`, `style.css`, `app.js` và `cycletracker.json`.

Trong phần này, chúng ta tạo `sw.js`, script service worker sẽ biến Web App của chúng ta thành PWA. Chúng ta đã có một file JavaScript; dòng cuối trong file HTML gọi `app.js`. JavaScript này cung cấp toàn bộ chức năng cho các tính năng web app chuẩn. Thay vì gọi file `sw.js` như chúng ta đã làm với `app.js` bằng thuộc tính `src` của {{HTMLElement("script")}}, chúng ta sẽ tạo mối quan hệ giữa web app và service worker của nó bằng cách đăng ký service worker.

Kết thúc bài học, bạn sẽ có một PWA đầy đủ chức năng; một ứng dụng web được nâng cấp dần, có thể cài đặt đầy đủ và vẫn hoạt động ngay cả khi người dùng ngoại tuyến.

## Trách nhiệm của service worker

Service worker là thành phần giúp ứng dụng hoạt động ngoại tuyến trong khi vẫn đảm bảo ứng dụng luôn cập nhật. Để làm tốt điều này, service worker nên bao gồm:

- Số phiên bản (hoặc định danh khác).
- Danh sách tài nguyên cần cache.
- Tên phiên bản của cache.

Service worker cũng chịu trách nhiệm:

- Cài đặt cache khi ứng dụng được cài đặt.
- Cập nhật chính nó và các file ứng dụng khác khi cần.
- Xóa các file đã cache nhưng không còn dùng nữa.

Chúng ta thực hiện các tác vụ này bằng cách phản ứng với ba sự kiện service worker, gồm:

- [`fetch`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/fetch_event),
- [`install`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event), và
- [`activate`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/activate_event)

### Số phiên bản

Khi PWA đã được cài trên máy người dùng, cách duy nhất để báo cho trình duyệt biết rằng có file cập nhật cần lấy xuống là phải thay đổi service worker. Nếu có thay đổi ở bất kỳ tài nguyên PWA nào khác - nếu HTML được cập nhật, một lỗi trong CSS được sửa, một hàm được thêm vào `app.js`, một ảnh được nén để giảm kích thước file, v.v. - service worker của PWA đã cài sẽ không biết rằng nó cần tải xuống tài nguyên cập nhật. Chỉ khi service worker thay đổi theo bất kỳ cách nào, PWA mới biết rằng có thể đã đến lúc cập nhật cache; và đó chính là nhiệm vụ của service worker.

Mặc dù về mặt kỹ thuật chỉ cần thay đổi bất kỳ ký tự nào cũng được, thực hành tốt nhất với PWA là tạo một hằng số số phiên bản được cập nhật tuần tự để biểu thị việc cập nhật file. Việc cập nhật số phiên bản (hoặc ngày tháng) cung cấp một chỉnh sửa chính thức cho service worker ngay cả khi bản thân service worker không thay đổi gì khác, đồng thời giúp nhà phát triển dễ nhận diện phiên bản ứng dụng.

#### Nhiệm vụ

Bắt đầu file JavaScript bằng cách thêm số phiên bản:

```js
const VERSION = "v1";
```

Lưu file thành `sw.js`

### Danh sách tài nguyên ngoại tuyến

Để có trải nghiệm ngoại tuyến tốt, danh sách file được cache nên bao gồm tất cả tài nguyên dùng trong trải nghiệm ngoại tuyến của PWA. Mặc dù manifest file có thể liệt kê rất nhiều biểu tượng ở nhiều kích cỡ khác nhau, application cache chỉ cần bao gồm các tài nguyên mà ứng dụng dùng ở chế độ ngoại tuyến.

```js
const APP_STATIC_RESOURCES = [
  "/",
  "/index.html",
  "/style.css",
  "/app.js",
  "/icon-512x512.png",
];
```

Bạn không cần đưa các biểu tượng khác nhau dùng cho mọi hệ điều hành và thiết bị vào danh sách. Nhưng hãy thêm bất kỳ hình ảnh nào được dùng bên trong ứng dụng, bao gồm tài sản dùng trong các splash page nếu ứng dụng tải chậm, hoặc các trang kiểu "bạn cần kết nối internet để có trải nghiệm đầy đủ".

Đừng đưa file service worker vào danh sách tài nguyên sẽ cache.

#### Nhiệm vụ

Thêm danh sách tài nguyên cần cache cho CycleTracker PWA vào `sw.js`.

#### Lời giải mẫu

Chúng ta bao gồm các tài nguyên tĩnh đã tạo ở các phần khác của hướng dẫn này mà CycleTracker cần để hoạt động khi ngoại tuyến. File `sw.js` hiện tại của chúng ta là:

```js
const VERSION = "v1";

const APP_STATIC_RESOURCES = [
  "/",
  "/index.html",
  "/style.css",
  "/app.js",
  "/cycletracker.json",
  "/icons/wheel.svg",
];
```

Chúng ta đã đưa biểu tượng `wheel.svg` vào, dù ứng dụng hiện tại chưa dùng nó, trong trường hợp bạn đang nâng cấp UI của PWA, chẳng hạn hiển thị logo khi chưa có dữ liệu chu kỳ.

### Tên cache của ứng dụng

Chúng ta đã có số phiên bản và có các file cần cache. Trước khi cache các file, chúng ta cần tạo một tên cache để lưu tài nguyên tĩnh của ứng dụng. Tên cache này nên có phiên bản để đảm bảo khi ứng dụng được cập nhật, cache mới sẽ được tạo và cache cũ sẽ bị xóa.

#### Nhiệm vụ

Dùng số `VERSION` để tạo `CACHE_NAME` có phiên bản, và thêm nó dưới dạng hằng số vào `sw.js`.

#### Lời giải mẫu

Chúng ta đặt tên cache là `period-tracker-` với `VERSION` hiện tại nối vào sau. Vì khai báo hằng này nằm trên một dòng, chúng ta đặt nó trước mảng tài nguyên để dễ đọc hơn.

```js
const VERSION = "v1";
const CACHE_NAME = `period-tracker-${VERSION}`;

const APP_STATIC_RESOURCES = [
  // …
];
```

Chúng ta đã khai báo thành công các hằng số; một định danh duy nhất, danh sách tài nguyên ngoại tuyến dưới dạng mảng, và tên cache của ứng dụng thay đổi mỗi khi định danh được cập nhật. Giờ hãy tập trung vào việc cài đặt, cập nhật và xóa các tài nguyên cached không dùng nữa.

### Lưu cache khi PWA được cài đặt

Khi người dùng cài đặt hoặc đơn giản chỉ truy cập một website có service worker, sự kiện `install` sẽ được kích hoạt trong phạm vi service worker. Chúng ta muốn lắng nghe sự kiện này, rồi điền cache bằng các tài nguyên tĩnh của PWA khi cài đặt. Mỗi lần phiên bản service worker được cập nhật, trình duyệt sẽ cài service worker mới và sự kiện install sẽ xảy ra.

Sự kiện `install` xảy ra khi ứng dụng được dùng lần đầu, hoặc khi trình duyệt phát hiện một phiên bản service worker mới. Khi service worker cũ bị thay thế bởi service worker mới, service worker cũ sẽ tiếp tục là service worker của PWA cho đến khi service worker mới được kích hoạt.

Chỉ có trong secure context, thuộc tính {{domxref("WorkerGlobalScope.caches")}} trả về một đối tượng {{domxref("CacheStorage")}} gắn với ngữ cảnh hiện tại. Phương thức {{domxref("CacheStorage.open()")}} trả về một {{jsxref("Promise")}} sẽ được giải quyết thành đối tượng {{domxref("Cache")}} khớp với tên cache, được truyền vào như một tham số.

Phương thức {{domxref("Cache.addAll()")}} nhận một mảng URL làm tham số, lấy chúng xuống, rồi thêm các response vào cache đã cho. Phương thức {{domxref("ExtendableEvent.waitUntil()")}} báo cho trình duyệt biết công việc vẫn đang diễn ra cho tới khi promise hoàn tất, và nó không nên chấm dứt service worker nếu muốn công việc đó hoàn thành. Mặc dù trình duyệt chịu trách nhiệm thực thi và chấm dứt service worker khi cần, phương thức `waitUntil` là một yêu cầu để trình duyệt không chấm dứt service worker trong khi một tác vụ đang chạy.

```js
self.addEventListener("install", (e) => {
  e.waitUntil(
    (async () => {
      const cache = await caches.open("cacheName_identifier");
      cache.addAll(["/", "/index.html", "/style.css", "/app.js"]);
    })(),
  );
});
```

#### Nhiệm vụ

Thêm một trình nghe sự kiện install lấy và lưu các file được liệt kê trong `APP_STATIC_RESOURCES` vào cache có tên `CACHE_NAME`.

#### Lời giải mẫu

```js
self.addEventListener("install", (event) => {
  event.waitUntil(
    (async () => {
      const cache = await caches.open(CACHE_NAME);
      cache.addAll(APP_STATIC_RESOURCES);
    })(),
  );
});
```

### Cập nhật PWA và xóa cache cũ

Như đã nói, khi một service worker hiện có đang được thay thế bằng một service worker mới, service worker hiện có sẽ tiếp tục là service worker của PWA cho đến khi service worker mới được kích hoạt. Chúng ta dùng sự kiện `activate` để xóa cache cũ nhằm tránh hết dung lượng. Chúng ta lặp qua các đối tượng {{domxref("Cache")}} có tên, xóa tất cả trừ cache hiện tại, rồi đặt service worker làm [`controller`](/en-US/docs/Web/API/ServiceWorkerContainer/controller) cho PWA.

Chúng ta lắng nghe sự kiện [`activate`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/activate_event) của global scope service worker hiện tại.

Chúng ta lấy tên của các cache có tên đã tồn tại. Chúng ta dùng phương thức {{domxref("CacheStorage.keys()")}} (vẫn truy cập `CacheStorage` thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}}) để nhận một {{jsxref("Promise")}} giải quyết thành một mảng chứa các chuỗi tương ứng với tất cả đối tượng {{domxref("Cache")}} có tên, theo thứ tự chúng được tạo.

Chúng ta dùng phương thức [`Promise.all()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) để lặp qua danh sách các promise tên cache đó. Phương thức `all()` nhận vào một danh sách các promise có thể lặp và trả về một `Promise` duy nhất. Với mỗi tên trong danh sách cache có tên, hãy kiểm tra cache đó có phải cache đang hoạt động hay không. Nếu không, hãy xóa nó bằng phương thức `Cache` [`delete()`](/en-US/docs/Web/API/Cache/delete).

Dòng cuối, `await clients.claim()`, dùng phương thức [`claim()`](/en-US/docs/Web/API/Clients/claim) của interface [`Clients`](/en-US/docs/Web/API/Clients) để cho phép service worker tự đặt mình làm controller của client; "client" ở đây là một phiên bản PWA đang chạy. Phương thức `claim()` cho phép service worker "giành quyền kiểm soát" tất cả client trong phạm vi của nó. Cách này giúp các client được tải trong cùng phạm vi không cần tải lại.

```js
self.addEventListener("activate", (event) => {
  event.waitUntil(
    (async () => {
      const names = await caches.keys();
      await Promise.all(
        names.map((name) => {
          if (name !== CACHE_NAME) {
            return caches.delete(name);
          }
          return undefined;
        }),
      );
      await clients.claim();
    })(),
  );
});
```

#### Nhiệm vụ

Thêm `activate` eventListener ở trên vào file `sw.js` của bạn.

### Sự kiện fetch

Chúng ta có thể tận dụng sự kiện [`fetch`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/fetch_event) để ngăn một PWA đã cài đặt gửi yêu cầu nếu người dùng đang ngoại tuyến. Lắng nghe sự kiện fetch giúp ta có thể chặn mọi yêu cầu và phản hồi bằng dữ liệu cached thay vì truy cập mạng. Hầu hết ứng dụng không cần hành vi này. Thực tế, nhiều mô hình kinh doanh muốn người dùng thường xuyên gửi yêu cầu đến server vì mục đích theo dõi và tiếp thị. Vì vậy, dù chặn yêu cầu có thể là một anti-pattern ở một số trường hợp, để cải thiện quyền riêng tư của ứng dụng CycleTracker, chúng ta không muốn ứng dụng gửi các yêu cầu server không cần thiết.

Vì PWA của chúng ta chỉ gồm một trang, đối với các yêu cầu điều hướng trang, chúng ta quay về trang chủ `index.html`. Không có trang nào khác và chúng ta không bao giờ muốn đi tới server. Nếu thuộc tính readonly [`mode`](/en-US/docs/Web/API/Request/mode) của [`Request`](/en-US/docs/Web/API/Request) trong Fetch API là `navigate`, nghĩa là nó đang tìm một trang web, chúng ta dùng phương thức [`respondWith()`](/en-US/docs/Web/API/FetchEvent/respondWith) của FetchEvent để ngăn xử lý fetch mặc định của trình duyệt, cung cấp promise phản hồi riêng của mình bằng phương thức [`caches.match()`](/en-US/docs/Web/API/CacheStorage/match).

Với mọi chế độ yêu cầu khác, chúng ta mở cache như trong [phản hồi của sự kiện install](#saving_the_cache_on_pwa_installation), nhưng lần này truyền request của event vào cùng phương thức `match()`. Nó kiểm tra xem request có phải khóa cho một {{domxref("Response")}} đã lưu hay không. Nếu có, nó trả về response đã cache. Nếu không, chúng ta trả về trạng thái [404](/en-US/docs/Web/HTTP/Reference/Status/404) làm response.

Việc dùng constructor [`Response()`](/en-US/docs/Web/API/Response/Response) để truyền body `null` và `status: 404` trong options không có nghĩa là PWA của chúng ta có lỗi. Thực ra, mọi thứ chúng ta cần lẽ ra đã nằm trong cache, và nếu không có, chúng ta sẽ không đi tới server để giải quyết vấn đề không đáng kể này.

```js
self.addEventListener("fetch", (event) => {
  // when seeking an HTML page
  if (event.request.mode === "navigate") {
    // Return to the index.html page
    event.respondWith(caches.match("/"));
    return;
  }

  // For every other request type
  event.respondWith(
    (async () => {
      const cache = await caches.open(CACHE_NAME);
      const cachedResponse = await cache.match(event.request.url);
      if (cachedResponse) {
        // Return the cached response if it's available.
        return cachedResponse;
      }
      // Respond with a HTTP 404 response status.
      return new Response(null, { status: 404 });
    })(),
  );
});
```

## File service worker hoàn chỉnh

File `sw.js` của bạn sẽ trông gần giống JavaScript dưới đây. Lưu ý rằng khi cập nhật bất kỳ tài nguyên nào trong mảng `APP_STATIC_RESOURCES`, hằng số hoặc hàm duy nhất cần cập nhật trong service worker này là giá trị của `VERSION`.

```js
// The version of the cache.
const VERSION = "v1";

// The name of the cache
const CACHE_NAME = `period-tracker-${VERSION}`;

// The static resources that the app needs to function.
const APP_STATIC_RESOURCES = [
  "/",
  "/index.html",
  "/app.js",
  "/style.css",
  "/icons/wheel.svg",
];

// On install, cache the static resources
self.addEventListener("install", (event) => {
  event.waitUntil(
    (async () => {
      const cache = await caches.open(CACHE_NAME);
      cache.addAll(APP_STATIC_RESOURCES);
    })(),
  );
});

// delete old caches on activate
self.addEventListener("activate", (event) => {
  event.waitUntil(
    (async () => {
      const names = await caches.keys();
      await Promise.all(
        names.map((name) => {
          if (name !== CACHE_NAME) {
            return caches.delete(name);
          }
          return undefined;
        }),
      );
      await clients.claim();
    })(),
  );
});

// On fetch, intercept server requests
// and respond with cached responses instead of going to network
self.addEventListener("fetch", (event) => {
  // As a single page app, direct app to always go to cached home page.
  if (event.request.mode === "navigate") {
    event.respondWith(caches.match("/"));
    return;
  }

  // For all other requests, go to the cache first, and then the network.
  event.respondWith(
    (async () => {
      const cache = await caches.open(CACHE_NAME);
      const cachedResponse = await cache.match(event.request.url);
      if (cachedResponse) {
        // Return the cached response if it's available.
        return cachedResponse;
      }
      // If resource isn't in the cache, return a 404.
      return new Response(null, { status: 404 });
    })(),
  );
});
```

When updating a service worker, the VERSION constant doesn't need to be updated, as any change in the content of the service worker script itself will trigger the browser to install the new service worker. However, it is a good practice to update the version number as it makes it easier for devs, including yourself, to see which version of the service worker is currently running in the browser, by [checking the name of the Cache in the Application tool](#with_developer_tools) (or Sources tool).

> [!NOTE]
> Updating VERSION is important when making changes to any application resource, including the CSS, HTML, and JS code, and image assets. The version number, or any change to the service worker file, is the only way to force an update of the app for your users.

## Register the service worker

Now that our service worker script is complete, we need to register the service worker.

We start by checking that the browser supports the [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) by using [feature detection](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection#the_concept_of_feature_detection) for the presence of the [`serviceWorker`](/en-US/docs/Web/API/ServiceWorker) property on the global [`navigator`](/en-US/docs/Web/API/Navigator) object:

```js
// Does "serviceWorker" exist
if ("serviceWorker" in navigator) {
  // If yes, we register the service worker
}
```

If the property is supported, we can then use the [`register()`](/en-US/docs/Web/API/ServiceWorkerContainer/register) method of the service worker API's [`ServiceWorkerContainer`](/en-US/docs/Web/API/ServiceWorkerContainer) interface.

```js
if ("serviceWorker" in navigator) {
  // Register the app's service worker
  // Passing the filename where that worker is defined.
  navigator.serviceWorker.register("sw.js");
}
```

While the above suffices for the CycleTracker app needs, the `register()` method does return a {{jsxref("Promise")}} that resolves with a {{domxref("ServiceWorkerRegistration")}} object. For a more robust application, error check the registration:

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker.register("sw.js").then(
    (registration) => {
      console.log("Service worker registration successful:", registration);
    },
    (error) => {
      console.error(`Service worker registration failed: ${error}`);
    },
  );
} else {
  console.error("Service workers are not supported.");
}
```

### Nhiệm vụ

Mở `index.html` và thêm {{HTMLElement("script")}} sau script dùng để include `app.js` và trước thẻ đóng `</body>`.

```html
<!-- Register the app's service worker. -->
<script>
  if ("serviceWorker" in navigator) {
    navigator.serviceWorker.register("sw.js");
  }
</script>
```

Bạn có thể thử [ứng dụng web theo dõi chu kỳ CycleTracker hoàn chỉnh](https://mdn.github.io/pwa-examples/cycletracker/service_workers/) và xem [mã nguồn ứng dụng web](https://github.com/mdn/pwa-examples/tree/main/cycletracker/service_workers) trên GitHub. Đúng là nó hoạt động, và giờ chính thức là một PWA!

## Gỡ lỗi service worker

Vì cách chúng ta thiết lập service worker, một khi nó đã được đăng ký thì mọi yêu cầu sẽ lấy từ cache thay vì tải nội dung mới. Khi phát triển, bạn sẽ thường xuyên chỉnh sửa code. Rất có thể bạn muốn kiểm thử các thay đổi trong trình duyệt thường xuyên; thường là sau mỗi lần lưu.

### Bằng cách cập nhật số phiên bản và thực hiện hard reset

Để có cache mới, bạn có thể đổi [số phiên bản](#version_number) rồi làm hard refresh trình duyệt. Cách hard refresh khác nhau tùy trình duyệt và hệ điều hành:

- Trên Windows: Ctrl+F5, Shift+F5, hoặc Ctrl+Shift+R.
- Trên macOS: Shift+Command+R.
- Safari trên macOS: Option+Command+E để xóa cache, rồi Option+Command+R.
- Trên di động: vào phần cài đặt của trình duyệt (Android) hoặc hệ điều hành (Samsung, iOS), tìm cài đặt site của trình duyệt (iOS) hoặc dữ liệu website (Android, Samsung) trong phần nâng cao, rồi xóa dữ liệu cho CycleTracker trước khi tải lại trang.

### Với developer tools

Có lẽ bạn không muốn cập nhật số phiên bản mỗi lần lưu. Cho tới khi bạn sẵn sàng phát hành phiên bản PWA mới ra production và cho mọi người một phiên bản PWA mới, thay vì đổi số phiên bản mỗi lần lưu, bạn có thể unregister service worker.

Bạn có thể unregister một service worker bằng cách nhấp nút `unregister` trong [browser developer tools](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools). Hard refresh trang sẽ đăng ký lại service worker và tạo cache mới.

![Firefox developer tools application panel with a stopped service worker and an unregister button](firefox_sw.jpg)

Trong một số developer tools, bạn có thể tự tay unregister một service worker, hoặc chọn tùy chọn "update on reload" cho service workers, tùy chọn này cấu hình developer tools để reset và kích hoạt lại service worker trong mỗi lần reload miễn là developer tools còn mở. Cũng có tùy chọn bỏ qua service worker và tải tài nguyên từ mạng. Bảng này có các tính năng chúng ta không đề cập trong hướng dẫn này, nhưng sẽ hữu ích khi bạn tạo các PWA nâng cao hơn có [syncing](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation#periodic_background_sync) và [push](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation#push), cả hai đều được đề cập trong [offline and background operation guide](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation).

![Edge developer tools showing the application panel set to a service worker](edge_sw.jpg)

Cửa sổ service worker trong application panel của DevTools cung cấp một liên kết để mở một cửa sổ bật lên chứa danh sách tất cả service worker đã đăng ký cho trình duyệt; không chỉ service worker của ứng dụng đang mở trong tab hiện tại. Mỗi danh sách service worker đều có các nút để dừng, khởi động hoặc unregister service worker riêng lẻ đó.

![Two service workers exist at localhost:8080. They can be unregistered from the list of service workers](edge_sw_list.jpg)

Nói cách khác, khi bạn đang làm việc trên PWA của mình, bạn không cần cập nhật số phiên bản cho mọi view của app. Nhưng hãy nhớ rằng, khi đã hoàn tất mọi thay đổi, hãy cập nhật giá trị VERSION của service worker trước khi phân phối phiên bản PWA đã cập nhật. Nếu quên, không ai đã cài app của bạn, hoặc thậm chí đã từng truy cập PWA online của bạn mà chưa cài, sẽ thấy các thay đổi đó!

## Xong rồi!

Về cốt lõi, PWA là một ứng dụng web có thể cài đặt và được nâng cấp dần để hoạt động ngoại tuyến. Chúng ta đã tạo một ứng dụng web đầy đủ chức năng. Sau đó, chúng ta thêm hai tính năng - manifest file và service worker - cần thiết để biến nó thành PWA. Nếu bạn muốn chia sẻ ứng dụng với người khác, hãy làm cho nó có thể truy cập qua kết nối an toàn. Hoặc nếu bạn chỉ muốn tự dùng trình theo dõi chu kỳ, hãy [tạo môi trường phát triển cục bộ](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection), [cài PWA](/en-US/docs/Web/Progressive_web_apps/Guides/Installing), và tận hưởng! Một khi đã cài, bạn không còn cần chạy localhost nữa.

Chúc mừng!

{{PreviousMenu("Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}
