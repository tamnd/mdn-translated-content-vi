---
title: Hoạt động ngoại tuyến và chạy nền
slug: Web/Progressive_web_apps/Guides/Offline_and_background_operation
page-type: guide
sidebar: pwasidebar
---

Thông thường, website phụ thuộc rất nhiều vào cả kết nối mạng ổn định lẫn việc người dùng đang mở trang trong trình duyệt. Nếu không có kết nối mạng, đa số website gần như không dùng được, và nếu người dùng không mở site trong một tab trình duyệt, đa số website cũng không thể làm gì.

Tuy nhiên, hãy xét các tình huống sau:

- Một ứng dụng nhạc cho phép người dùng phát trực tuyến khi đang online, nhưng có thể tải bài hát xuống trong nền rồi tiếp tục phát khi người dùng ngoại tuyến.
- Người dùng soạn một email dài, nhấn "Send", rồi mất kết nối mạng. Thiết bị sẽ gửi email trong nền ngay khi mạng khả dụng trở lại.
- Ứng dụng chat của người dùng nhận một tin nhắn từ một liên hệ, và mặc dù ứng dụng không mở, nó vẫn hiển thị một huy hiệu trên biểu tượng ứng dụng để cho người dùng biết họ có tin nhắn mới.

Đây là những kiểu tính năng mà người dùng kỳ vọng ở các ứng dụng đã cài đặt. Trong hướng dẫn này, chúng ta sẽ giới thiệu một bộ công nghệ cho phép PWA:

- Cung cấp trải nghiệm người dùng tốt ngay cả khi thiết bị có kết nối mạng chập chờn
- Cập nhật trạng thái của nó khi ứng dụng không chạy
- Thông báo cho người dùng về các sự kiện quan trọng đã xảy ra trong lúc ứng dụng không chạy

Các công nghệ được giới thiệu trong hướng dẫn này là:

- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Background Synchronization API](/en-US/docs/Web/API/Background_Synchronization_API)
- [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API)
- [Periodic Background Synchronization API](/en-US/docs/Web/API/Web_Periodic_Background_Synchronization_API)
- [Push API](/en-US/docs/Web/API/Push_API)
- [Notifications API](/en-US/docs/Web/API/Notifications_API)

## Website và worker

Nền tảng của tất cả công nghệ chúng ta sẽ thảo luận trong hướng dẫn này là _service worker_. Trong phần này, chúng ta sẽ cung cấp một chút bối cảnh về worker và cách chúng thay đổi kiến trúc của một web app.

Thông thường, cả website chạy trên một luồng duy nhất. Điều này bao gồm JavaScript của chính website và toàn bộ công việc để dựng giao diện của website. Hệ quả của việc này là nếu JavaScript của bạn chạy một tác vụ kéo dài lâu, giao diện chính của website sẽ bị chặn, và website có vẻ không phản hồi với người dùng.

Một [service worker](/en-US/docs/Web/API/Service_Worker_API) là một loại [web worker](/en-US/docs/Web/API/Web_Workers_API) cụ thể được dùng để triển khai PWA. Giống như mọi web worker, service worker chạy trên một luồng riêng biệt so với mã JavaScript chính. Mã chính tạo worker, truyền vào một URL tới script của worker. Worker và mã chính không thể truy cập trực tiếp trạng thái của nhau, nhưng có thể giao tiếp bằng cách gửi thông điệp cho nhau. Worker có thể được dùng để chạy các tác vụ tính toán tốn kém trong nền: vì chúng chạy trên một luồng riêng, mã JavaScript chính của ứng dụng, phần triển khai giao diện người dùng, có thể vẫn phản hồi người dùng.

Vì vậy, một PWA luôn có kiến trúc mức cao được tách giữa:

- _Ứng dụng chính_, với HTML, CSS, và phần JavaScript triển khai giao diện của ứng dụng (ví dụ bằng cách xử lý sự kiện người dùng)
- _Service worker_, xử lý các tác vụ ngoại tuyến và chạy nền

Trong hướng dẫn này, khi chúng ta đưa ví dụ mã, chúng ta sẽ chỉ ra phần nào của ứng dụng mà mã thuộc về bằng chú thích như `// main.js` hoặc `// service-worker.js`.

## Hoạt động ngoại tuyến

Hoạt động ngoại tuyến cho phép PWA cung cấp trải nghiệm người dùng tốt ngay cả khi thiết bị không có kết nối mạng. Điều này được bật bằng cách thêm một service worker vào ứng dụng.

Service worker _kiểm soát_ một số hoặc toàn bộ các trang của ứng dụng. Khi service worker được cài đặt, nó có thể lấy tài nguyên từ máy chủ cho các trang mà nó kiểm soát (bao gồm trang, style, script, và ảnh, chẳng hạn) và thêm chúng vào một cache cục bộ. Giao diện {{domxref("Cache")}} được dùng để thêm tài nguyên vào cache. Các thể hiện `Cache` có thể truy cập qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong global scope của service worker.

Sau đó, bất cứ khi nào ứng dụng yêu cầu một tài nguyên (ví dụ, vì người dùng mở ứng dụng hoặc nhấp một liên kết nội bộ), trình duyệt phát một sự kiện gọi là {{domxref("ServiceWorkerGlobalScope.fetch_event", "fetch")}} trong global scope của service worker. Bằng cách lắng nghe sự kiện này, service worker có thể chặn yêu cầu.

Trình xử lý sự kiện cho `fetch` nhận một đối tượng {{domxref("FetchEvent")}}, đối tượng này:

- Cung cấp quyền truy cập vào yêu cầu dưới dạng một thể hiện {{domxref("Request")}}
- Cung cấp phương thức {{domxref("FetchEvent.respondWith", "respondWith()")}} để gửi phản hồi tới yêu cầu.

Một cách service worker có thể xử lý yêu cầu là chiến lược "cache trước". Trong chiến lược này:

1. Nếu tài nguyên được yêu cầu có trong cache, lấy tài nguyên từ cache và trả nó về cho ứng dụng.
2. Nếu tài nguyên được yêu cầu không có trong cache, thử lấy nó từ mạng.
   1. Nếu tài nguyên có thể được lấy, thêm nó vào cache cho lần sau, và trả nó về cho ứng dụng.
   2. Nếu không thể lấy được tài nguyên, trả về một tài nguyên dự phòng mặc định.

Đoạn mã sau cho thấy cách triển khai:

```js
// service-worker.js

const putInCache = async (request, response) => {
  const cache = await caches.open("v1");
  await cache.put(request, response);
};

const cacheFirst = async ({ request, fallbackUrl }) => {
  // Trước tiên thử lấy tài nguyên từ cache.
  const responseFromCache = await caches.match(request);
  if (responseFromCache) {
    return responseFromCache;
  }

  // Nếu không tìm thấy phản hồi trong cache,
  // thử lấy tài nguyên từ mạng.
  try {
    const responseFromNetwork = await fetch(request);
    // Nếu yêu cầu mạng thành công, clone phản hồi:
    // - đặt một bản vào cache, cho lần sau
    // - trả về bản gốc cho ứng dụng
    // Cần clone vì một phản hồi chỉ có thể được tiêu thụ một lần.
    putInCache(request, responseFromNetwork.clone());
    return responseFromNetwork;
  } catch (error) {
    // Nếu yêu cầu mạng thất bại,
    // lấy phản hồi dự phòng từ cache.
    const fallbackResponse = await caches.match(fallbackUrl);
    if (fallbackResponse) {
      return fallbackResponse;
    }
    // Khi ngay cả phản hồi dự phòng cũng không có,
    // chúng ta không thể làm gì hơn, nhưng luôn phải
    // trả về một đối tượng Response.
    return new Response("Network error happened", {
      status: 408,
      headers: { "Content-Type": "text/plain" },
    });
  }
};

self.addEventListener("fetch", (event) => {
  event.respondWith(
    cacheFirst({
      request: event.request,
      fallbackUrl: "/fallback.html",
    }),
  );
});
```

Điều này có nghĩa là trong nhiều tình huống, web app sẽ hoạt động tốt ngay cả khi kết nối mạng chập chờn. Từ góc nhìn của mã ứng dụng chính, mọi thứ hoàn toàn minh bạch: ứng dụng chỉ thực hiện các yêu cầu mạng và nhận phản hồi. Ngoài ra, vì service worker nằm trên một luồng riêng, mã ứng dụng chính có thể vẫn phản hồi đầu vào của người dùng trong khi tài nguyên được lấy và cache.

> [!NOTE]
> Chiến lược được mô tả ở đây chỉ là một cách service worker có thể triển khai cache. Cụ thể, trong chiến lược cache trước, chúng ta kiểm tra cache trước mạng, nghĩa là nhiều khả năng sẽ trả về phản hồi nhanh mà không tốn chi phí mạng, nhưng cũng dễ trả về phản hồi cũ hơn.
>
> Một lựa chọn khác là chiến lược _mạng trước_, trong đó chúng ta thử lấy tài nguyên từ máy chủ trước, và quay về cache nếu thiết bị ngoại tuyến.
>
> Chiến lược cache tối ưu phụ thuộc vào từng web app cụ thể và cách nó được dùng.

Để biết chi tiết hơn về việc thiết lập service worker và dùng chúng để thêm chức năng ngoại tuyến, xem [hướng dẫn sử dụng service worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers).

## Hoạt động nền

Trong khi hoạt động ngoại tuyến là trường hợp sử dụng phổ biến nhất của service worker, chúng cũng cho phép PWA hoạt động ngay cả khi ứng dụng chính đã đóng. Điều này khả thi vì service worker có thể chạy trong khi ứng dụng chính không chạy.

Điều này không có nghĩa là service worker chạy suốt thời gian: trình duyệt có thể dừng service worker khi thấy phù hợp. Ví dụ, nếu service worker đã không hoạt động một thời gian, nó sẽ bị dừng. Tuy nhiên, trình duyệt sẽ khởi động lại service worker khi đã có một sự kiện mà nó cần xử lý. Điều này cho phép PWA triển khai hoạt động nền theo cách sau:

- Trong ứng dụng chính, đăng ký một yêu cầu để service worker thực hiện một thao tác
- Vào thời điểm phù hợp, service worker sẽ được khởi động lại nếu cần, và một sự kiện sẽ được phát trong phạm vi của service worker
- Service worker sẽ thực hiện thao tác đó

Ở các phần tiếp theo, chúng ta sẽ thảo luận một vài tính năng khác nhau dùng mẫu này để cho phép PWA hoạt động khi ứng dụng chính không mở.

## Background sync

Giả sử người dùng soạn một email rồi nhấn "Send". Trong một website truyền thống, họ phải giữ tab mở cho tới khi ứng dụng gửi xong email: nếu họ đóng tab, hoặc thiết bị mất kết nối, thì thư sẽ không được gửi. Background sync, được định nghĩa trong [Background Synchronization API](/en-US/docs/Web/API/Background_Synchronization_API), là giải pháp cho vấn đề này đối với PWA.

Background sync cho phép ứng dụng yêu cầu service worker thực hiện một tác vụ thay mặt nó. Ngay khi thiết bị có kết nối mạng, trình duyệt sẽ khởi động lại service worker, nếu cần, và phát một sự kiện tên là [`sync`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/sync_event) trong phạm vi của service worker. Service worker sau đó có thể thử thực thi tác vụ. Nếu tác vụ không thể hoàn thành, trình duyệt có thể thử lại một số lần giới hạn bằng cách phát lại sự kiện.

### Đăng ký sự kiện sync

Để yêu cầu service worker thực hiện một tác vụ, ứng dụng chính có thể truy cập {{domxref("ServiceWorkerContainer/ready", "navigator.serviceWorker.ready")}}, đối tượng này sẽ được giải quyết thành một đối tượng {{domxref("ServiceWorkerRegistration")}}. Sau đó ứng dụng gọi {{domxref("SyncManager/register", "sync.register()")}} trên đối tượng `ServiceWorkerRegistration`, như sau:

```js
// main.js

async function registerSync() {
  const swRegistration = await navigator.serviceWorker.ready;
  swRegistration.sync.register("send-message");
}
```

Lưu ý rằng ứng dụng truyền một tên cho tác vụ: ở đây là `"send-message"`.

### Xử lý sự kiện sync

Ngay khi thiết bị có kết nối mạng, sự kiện `sync` được phát trong phạm vi service worker. Service worker kiểm tra tên tác vụ và chạy hàm phù hợp, ở đây là `sendMessage()`:

```js
// service-worker.js

self.addEventListener("sync", (event) => {
  if (event.tag === "send-message") {
    event.waitUntil(sendMessage());
  }
});
```

Lưu ý rằng chúng ta truyền kết quả của hàm `sendMessage()` vào phương thức {{domxref("ExtendableEvent/waitUntil", "waitUntil()")}} của sự kiện. Phương thức `waitUntil()` nhận một {{jsxref("Promise")}} làm tham số và yêu cầu trình duyệt không dừng service worker cho tới khi promise đó được giải quyết. Đây cũng là cách trình duyệt biết thao tác có thành công hay không: nếu promise bị reject, trình duyệt có thể thử lại bằng cách phát sự kiện `sync` một lần nữa.

Phương thức `waitUntil()` không phải là một bảo đảm rằng trình duyệt sẽ không dừng service worker: nếu thao tác mất quá nhiều thời gian, service worker vẫn sẽ bị dừng. Nếu điều này xảy ra, thao tác bị hủy, và lần tiếp theo sự kiện `sync` được phát, trình xử lý sẽ chạy lại từ đầu - nó không tiếp tục từ chỗ đã dừng.

Thế nào là "quá lâu" phụ thuộc từng trình duyệt. Với Chrome, service worker có thể bị đóng nếu:

- Nó không hoạt động trong 30 giây
- Nó đã chạy JavaScript đồng bộ trong 30 giây
- Promise được truyền vào `waitUntil()` mất hơn 5 phút để giải quyết

## Background fetch

Background sync hữu ích cho các thao tác nền tương đối ngắn, nhưng như ta vừa thấy: nếu service worker không hoàn tất xử lý sự kiện sync trong thời gian tương đối ngắn, trình duyệt sẽ dừng service worker. Đây là một biện pháp có chủ đích để tiết kiệm pin và bảo vệ quyền riêng tư của người dùng bằng cách giảm thiểu thời gian địa chỉ IP của người dùng bị lộ cho máy chủ trong khi ứng dụng ở nền.

Điều này khiến background sync không phù hợp cho các thao tác dài hơn - tải một bộ phim chẳng hạn. Với tình huống này, bạn cần [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API). Với background fetch, các yêu cầu mạng có thể được thực hiện trong khi cả UI ứng dụng chính và service worker đều đã đóng.

Với background fetch:

- Yêu cầu được khởi tạo từ UI ứng dụng chính
- Dù ứng dụng chính có mở hay không, trình duyệt sẽ hiển thị một phần tử UI bền vững để thông báo cho người dùng về yêu cầu đang diễn ra, và cho phép họ hủy hoặc kiểm tra tiến trình
- Khi yêu cầu hoàn tất thành công hoặc thất bại, hoặc khi người dùng yêu cầu kiểm tra tiến trình, trình duyệt sẽ khởi động service worker (nếu cần) và phát sự kiện phù hợp trong phạm vi service worker

### Tạo yêu cầu background fetch

Yêu cầu background fetch được khởi tạo trong mã ứng dụng chính bằng cách gọi {{domxref("BackgroundFetchManager/fetch", "backgroundFetch.fetch()")}} trên đối tượng `ServiceWorkerRegistration`, như sau:

```js
// main.js

async function requestBackgroundFetch(movieData) {
  const swRegistration = await navigator.serviceWorker.ready;
  const fetchRegistration = await swRegistration.backgroundFetch.fetch(
    "download-movie",
    ["/my-movie-part-1.webm", "/my-movie-part-2.webm"],
    {
      icons: movieIcons,
      title: "Downloading my movie",
      downloadTotal: 60 * 1024 * 1024,
    },
  );
  // …
}
```

Chúng ta đang truyền ba đối số vào `backgroundFetch.fetch()`:

1. Một định danh cho yêu cầu fetch này
2. Một mảng các đối tượng {{domxref("Request")}} hoặc URL. Một yêu cầu background fetch đơn lẻ có thể bao gồm nhiều yêu cầu mạng.
3. Một đối tượng chứa dữ liệu cho UI mà trình duyệt dùng để hiển thị sự tồn tại và tiến trình của yêu cầu.

Lệnh gọi `backgroundFetch.fetch()` trả về một {{jsxref("Promise")}} sẽ được giải quyết thành một đối tượng {{domxref("BackgroundFetchRegistration")}}. Điều này cho phép ứng dụng chính cập nhật UI của nó khi yêu cầu tiến triển. Tuy nhiên, nếu ứng dụng chính bị đóng, quá trình fetch sẽ vẫn tiếp tục trong nền.

Trình duyệt sẽ hiển thị một phần tử UI bền vững nhắc người dùng rằng yêu cầu vẫn đang diễn ra, cho họ cơ hội tìm hiểu thêm về yêu cầu đó và hủy nếu muốn. UI sẽ bao gồm biểu tượng và tiêu đề lấy từ các đối số `icons` và `title`, và dùng `downloadTotal` làm ước lượng tổng dung lượng tải xuống để hiển thị tiến trình.

### Xử lý kết quả yêu cầu

Khi quá trình fetch hoàn tất thành công hoặc thất bại, hoặc khi người dùng nhấp vào UI tiến trình, trình duyệt sẽ khởi động service worker của ứng dụng, nếu cần, và phát một sự kiện trong phạm vi service worker. Các sự kiện sau có thể được phát:

- `backgroundfetchsuccess`: tất cả yêu cầu đều thành công
- `backgroundfetchfail`: ít nhất một yêu cầu thất bại
- `backgroundfetchabort`: quá trình fetch bị hủy bởi người dùng hoặc bởi ứng dụng chính
- `backgroundfetchclick`: người dùng nhấp vào phần tử UI tiến trình mà trình duyệt đang hiển thị

#### Lấy dữ liệu phản hồi

Trong các trình xử lý cho sự kiện `backgroundfetchsuccess`, `backgroundfetchfail`, và `backgroundfetchabort`, service worker có thể truy xuất dữ liệu yêu cầu và phản hồi.

Để lấy phản hồi, trình xử lý sự kiện truy cập thuộc tính {{domxref("BackgroundFetchEvent/registration", "registration")}} của sự kiện. Đây là một đối tượng {{domxref("BackgroundFetchRegistration")}}, có các phương thức {{domxref("BackgroundFetchRegistration/matchAll", "matchAll()")}} và {{domxref("BackgroundFetchRegistration/match", "match()")}} trả về các đối tượng {{domxref("BackgroundFetchRecord")}} khớp với URL được cho (hoặc, trong trường hợp `matchAll()`, tất cả bản ghi nếu không cho URL).

Mỗi `BackgroundFetchRecord` có thuộc tính {{domxref("BackgroundFetchRecord/responseReady", "responseReady")}} là một `Promise` được giải quyết với đối tượng {{domxref("Response")}} khi phản hồi khả dụng.

Vì vậy, để truy cập dữ liệu phản hồi, trình xử lý có thể làm như sau:

```js
// service-worker.js

self.addEventListener("backgroundfetchsuccess", (event) => {
  const registration = event.registration;

  event.waitUntil(async () => {
    const registration = event.registration;
    const records = await registration.matchAll();
    const responsePromises = records.map(
      async (record) => await record.responseReady,
    );

    const responses = Promise.all(responsePromises);
    // làm gì đó với các phản hồi
  });
});
```

Vì dữ liệu phản hồi sẽ không còn khả dụng sau khi trình xử lý kết thúc, trình xử lý nên lưu dữ liệu đó (ví dụ, trong {{domxref("Cache")}}) nếu ứng dụng vẫn muốn giữ nó.

#### Cập nhật UI của trình duyệt

Đối tượng sự kiện được truyền vào `backgroundfetchsuccess` và `backgroundfetchfail` cũng có phương thức {{domxref("BackgroundFetchUpdateUIEvent/updateUI", "updateUI()")}}, có thể dùng để cập nhật UI mà trình duyệt hiển thị nhằm giữ người dùng được thông báo về thao tác fetch. Với `updateUI()`, trình xử lý có thể cập nhật tiêu đề và biểu tượng của phần tử UI:

```js
// service-worker.js

self.addEventListener("backgroundfetchsuccess", (event) => {
  // lấy và lưu dữ liệu phản hồi
  // …

  event.updateUI({ title: "Đã tải xong!" });
});

self.addEventListener("backgroundfetchfail", (event) => {
  event.updateUI({ title: "Không thể hoàn tất tải xuống" });
});
```

#### Phản hồi tương tác của người dùng

Sự kiện `backgroundfetchclick` được phát khi người dùng nhấp vào phần tử UI mà trình duyệt hiển thị trong lúc fetch đang diễn ra.

Phản hồi mong đợi ở đây là mở một cửa sổ cung cấp cho người dùng thêm thông tin về thao tác fetch, việc này có thể thực hiện từ service worker bằng {{domxref("Clients/openWindow", "clients.openWindow()")}}. Ví dụ:

```js
// service-worker.js

self.addEventListener("backgroundfetchclick", (event) => {
  const registration = event.registration;

  if (registration.result === "success") {
    clients.openWindow("/play-movie");
  } else {
    clients.openWindow("/movie-download-progress");
  }
});
```

## Periodic background sync

[Periodic Background Synchronization API](/en-US/docs/Web/API/Web_Periodic_Background_Synchronization_API) cho phép PWA định kỳ cập nhật dữ liệu của nó trong nền, trong khi ứng dụng chính đã đóng.

Điều này có thể cải thiện đáng kể trải nghiệm ngoại tuyến mà PWA mang lại. Hãy xem một ứng dụng phụ thuộc vào nội dung khá mới, như một app tin tức. Nếu thiết bị ngoại tuyến khi người dùng mở ứng dụng, thì ngay cả với cache dựa trên service worker, các bài viết cũng chỉ mới như lần cuối ứng dụng được mở. Với periodic background sync, ứng dụng có thể đã làm mới bài viết trong nền khi thiết bị có kết nối, và do đó có thể hiển thị nội dung tương đối mới cho người dùng.

Điều này tận dụng thực tế là đặc biệt trên thiết bị di động, kết nối không hẳn là kém mà là _chập chờn_: bằng cách tận dụng những lúc thiết bị có kết nối, ứng dụng có thể san phẳng các khoảng trống kết nối.

### Đăng ký sự kiện periodic sync

Mã đăng ký sự kiện periodic sync tuân theo cùng mẫu như [đăng ký sự kiện sync](#registering_a_sync_event). {{domxref("ServiceWorkerRegistration")}} có thuộc tính {{domxref("ServiceWorkerRegistration.periodicSync", "periodicSync")}}, thuộc tính này có phương thức {{domxref("PeriodicSyncManager/register", "register()")}} nhận tên của periodic sync làm tham số.

Tuy nhiên, `periodicSync.register()` nhận thêm một đối số, là một đối tượng có thuộc tính `minInterval`. Đây là khoảng thời gian tối thiểu, tính bằng mili giây, giữa các lần thử đồng bộ:

```js
// main.js

async function registerPeriodicSync() {
  const swRegistration = await navigator.serviceWorker.ready;
  swRegistration.periodicSync.register("update-news", {
    // thử cập nhật mỗi 24 giờ
    minInterval: 24 * 60 * 60 * 1000,
  });
}
```

### Xử lý sự kiện periodic sync

Mặc dù PWA yêu cầu một khoảng thời gian cụ thể trong lệnh gọi `register()`, việc tạo sự kiện periodic sync bao lâu một lần lại do trình duyệt quyết định. Các ứng dụng mà người dùng mở và tương tác thường xuyên sẽ có nhiều khả năng nhận periodic sync hơn, và cũng nhận chúng thường xuyên hơn, so với các ứng dụng mà người dùng hiếm khi hoặc không bao giờ tương tác.

Khi trình duyệt quyết định tạo một sự kiện periodic sync, quy trình như sau: nó khởi động service worker, nếu cần, và phát một sự kiện {{domxref("ServiceWorkerGlobalScope.periodicsync_event", "periodicSync")}} trong global scope của service worker.

Trình xử lý sự kiện của service worker kiểm tra tên sự kiện, và gọi hàm phù hợp bên trong phương thức {{domxref("ExtendableEvent/waitUntil", "waitUntil()")}} của sự kiện:

```js
// service-worker.js

self.addEventListener("periodicsync", (event) => {
  if (event.tag === "update-news") {
    event.waitUntil(updateNews());
  }
});
```

Bên trong `updateNews()`, service worker có thể lấy và cache các tin mới nhất. Hàm `updateNews()` nên hoàn thành tương đối nhanh: nếu service worker mất quá nhiều thời gian để cập nhật nội dung, trình duyệt sẽ dừng nó.

### Hủy đăng ký periodic sync

Khi PWA không còn cần cập nhật nền định kỳ nữa, (ví dụ, vì người dùng đã tắt nó trong cài đặt của ứng dụng) thì PWA nên yêu cầu trình duyệt dừng tạo sự kiện periodic sync, bằng cách gọi phương thức {{domxref("PeriodicSyncManager/unregister", "unregister()")}} của {{domxref("serviceWorkerRegistration.periodicSync", "periodicSync")}}:

```js
// main.js

async function unregisterPeriodicSync() {
  const swRegistration = await navigator.serviceWorker.ready;
  swRegistration.periodicSync.unregister("update-news");
}
```

## Push

[Push API](/en-US/docs/Web/API/Push_API) cho phép PWA nhận tin nhắn được đẩy từ máy chủ, dù ứng dụng đang chạy hay không. Khi tin nhắn được thiết bị nhận, service worker của ứng dụng được khởi động và xử lý tin nhắn, và một [notification](/en-US/docs/Web/API/Notifications_API) được hiển thị cho người dùng. Đặc tả cho phép "silent push" trong đó không hiển thị notification, nhưng không có trình duyệt nào hỗ trợ điều này, do lo ngại về quyền riêng tư (ví dụ, push có thể được dùng để theo dõi vị trí của người dùng).

Việc hiển thị notification cho người dùng làm họ bị phân tâm khỏi việc đang làm và có thể rất gây phiền, nên hãy dùng push message thật cẩn thận. Nói chung, chúng phù hợp cho những tình huống bạn cần cảnh báo người dùng về điều gì đó, và không thể chờ đến lần tiếp theo họ mở ứng dụng.

Một trường hợp sử dụng phổ biến của push notification là ứng dụng chat: khi người dùng nhận được tin nhắn từ một liên hệ, nó được gửi dưới dạng push message và ứng dụng hiển thị notification.

Push message không được gửi trực tiếp từ máy chủ ứng dụng tới thiết bị. Thay vào đó, máy chủ ứng dụng của bạn gửi tin nhắn tới một push service, rồi thiết bị có thể lấy chúng và chuyển tới ứng dụng.

Điều này cũng có nghĩa là tin nhắn từ máy chủ của bạn tới push service cần được {{Glossary("Encryption", "mã hóa")}} (để push service không đọc được chúng) và {{Glossary("Signature/Security", "ký số")}} (để push service biết rằng các tin nhắn thực sự đến từ máy chủ của bạn, chứ không phải từ ai đó giả mạo máy chủ của bạn).

Push service do nhà cung cấp trình duyệt hoặc bên thứ ba vận hành, và máy chủ ứng dụng giao tiếp với nó bằng giao thức [HTTP Push](https://datatracker.ietf.org/doc/html/rfc8030). Máy chủ ứng dụng có thể dùng một thư viện bên thứ ba như [web-push](https://github.com/web-push-libs/web-push) để xử lý chi tiết giao thức.

### Đăng ký nhận push message

Mẫu đăng ký push message như sau:

![Sơ đồ cho thấy các bước đăng ký push message](push-messaging-1.svg)

1. Là điều kiện tiên quyết, máy chủ ứng dụng cần được cung cấp một {{Glossary("Public-key_cryptography", "cặp khóa công khai/riêng tư")}}, để có thể ký push message. Việc ký thông điệp cần tuân theo đặc tả [VAPID](https://datatracker.ietf.org/doc/html/draft-thomson-webpush-vapid-02).

2. Trên thiết bị, ứng dụng dùng phương thức {{domxref("PushManager.subscribe()")}} để đăng ký nhận tin nhắn từ máy chủ. Phương thức `subscribe()`:
   - Nhận khóa công khai của máy chủ ứng dụng làm đối số: đây là thứ push service sẽ dùng để xác minh chữ ký trên các thông điệp từ máy chủ ứng dụng.

   - Trả về một `Promise` sẽ được giải quyết thành một đối tượng {{domxref("PushSubscription")}}. Đối tượng này bao gồm:
     - [endpoint](/en-US/docs/Web/API/PushSubscription/endpoint) cho push service: đây là cách máy chủ ứng dụng biết nơi gửi push message.
     - [public encryption key](/en-US/docs/Web/API/PushSubscription/getKey) mà máy chủ của bạn sẽ dùng để mã hóa thông điệp gửi tới push service.

3. Ứng dụng gửi endpoint và public encryption key tới máy chủ của bạn (ví dụ, bằng {{domxref("WorkerGlobalScope/fetch", "fetch()")}}).

Sau đó, máy chủ ứng dụng có thể bắt đầu gửi push message.

### Gửi, chuyển giao, và xử lý push message

Khi có một sự kiện xảy ra trên máy chủ mà máy chủ muốn ứng dụng xử lý, máy chủ có thể gửi tin nhắn, và chuỗi bước diễn ra như sau:

![Sơ đồ cho thấy các bước gửi và chuyển giao push message](push-messaging-2.svg)

1. Máy chủ ứng dụng ký thông điệp bằng khóa ký riêng tư của nó và mã hóa thông điệp bằng public encryption key cho push service. Máy chủ ứng dụng có thể dùng thư viện như [web-push](https://github.com/web-push-libs/web-push) để đơn giản hóa việc này.
2. Máy chủ ứng dụng gửi thông điệp tới endpoint của push service, bằng giao thức [HTTP Push](https://datatracker.ietf.org/doc/html/rfc8030), và cũng có thể dùng thư viện như web-push.
3. Push service kiểm tra chữ ký trên thông điệp, và nếu chữ ký hợp lệ, push service sẽ xếp hàng tin nhắn để chuyển giao.
4. Khi thiết bị có kết nối mạng, push service chuyển thông điệp đã mã hóa tới trình duyệt.
5. Khi trình duyệt nhận được thông điệp đã mã hóa, nó giải mã thông điệp.
6. Trình duyệt khởi động service worker nếu cần, và phát một sự kiện gọi là {{domxref("ServiceWorkerGlobalScope.push_event", "push")}} trong global scope của service worker. Trình xử lý sự kiện nhận một đối tượng {{domxref("PushEvent")}}, chứa dữ liệu tin nhắn.
7. Trong trình xử lý sự kiện của nó, service worker thực hiện bất kỳ xử lý nào cho thông điệp. Như thường lệ, trình xử lý sự kiện gọi `event.waitUntil()` để yêu cầu trình duyệt giữ service worker chạy.
8. Trong trình xử lý sự kiện của nó, service worker tạo một notification bằng {{domxref("ServiceWorkerRegistration/showNotification", "registration.showNotification()")}}.
9. Nếu người dùng nhấp notification hoặc đóng nó, các sự kiện {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}} và {{domxref("ServiceWorkerGlobalScope.notificationclose_event", "notificationclose")}}, tương ứng, sẽ được phát trong global scope của service worker. Điều này cho phép ứng dụng xử lý phản hồi của người dùng đối với notification.

## Quyền và hạn chế

Trình duyệt phải tìm được sự cân bằng để có thể cung cấp các API mạnh cho nhà phát triển web mà vẫn bảo vệ người dùng khỏi website độc hại, khai thác, hoặc viết kém. Một trong những bảo vệ chính mà chúng cung cấp là người dùng có thể đóng các trang của website, và khi đó nó không còn hoạt động trên thiết bị nữa. Các API được mô tả trong bài viết này thường làm suy giảm đảm bảo đó, nên trình duyệt phải thực hiện các bước bổ sung để giúp bảo đảm người dùng nhận thức được điều này, và rằng các API được dùng theo cách phù hợp với lợi ích của người dùng.

Trong phần này, chúng ta sẽ phác thảo những bước đó. Một số API này yêu cầu [quyền người dùng](/en-US/docs/Web/API/Permissions_API) rõ ràng, cùng nhiều hạn chế và lựa chọn thiết kế khác để bảo vệ người dùng.

- Background Sync API không cần quyền người dùng rõ ràng, nhưng việc đưa ra một yêu cầu background sync chỉ có thể thực hiện khi ứng dụng chính đang mở, và trình duyệt giới hạn số lần thử lại cũng như khoảng thời gian mà các thao tác background sync có thể kéo dài.

- Background Fetch API yêu cầu quyền người dùng `"background-fetch"`, và trình duyệt hiển thị tiến trình đang diễn ra của thao tác fetch, cho phép người dùng hủy nó.

- Periodic Background Sync API yêu cầu quyền người dùng `"periodic-background-sync"`, và trình duyệt nên cho phép người dùng tắt hoàn toàn periodic background sync. Ngoài ra, trình duyệt có thể gắn tần suất sự kiện sync với mức độ người dùng chọn tương tác với ứng dụng: vì thế một ứng dụng mà người dùng hiếm khi dùng có thể nhận ít sự kiện (hoặc thậm chí không có sự kiện nào).

- Push API yêu cầu quyền người dùng `"push"`, và mọi trình duyệt đều yêu cầu push event phải hiển thị với người dùng, nghĩa là chúng tạo ra một notification mà người dùng nhìn thấy được.

## Xem thêm

### Tham khảo

- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Background Synchronization API](/en-US/docs/Web/API/Background_Synchronization_API)
- [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API)
- [Periodic Background Synchronization API](/en-US/docs/Web/API/Web_Periodic_Background_Synchronization_API)
- [Push API](/en-US/docs/Web/API/Push_API)
- [Notifications API](/en-US/docs/Web/API/Notifications_API)

### Hướng dẫn

- [Introducing Background Sync](https://developer.chrome.com/blog/background-sync/) trên developer.chrome.com (2017)
- [Introducing Background Fetch](https://developer.chrome.com/blog/background-fetch/) trên developer.chrome.com (2022)
- [The Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync) trên developer.chrome.com (2020)
- [Notifications](https://web.dev/explore/notifications) trên web.dev
- [PWA with offline streaming](https://web.dev/articles/pwa-with-offline-streaming) trên web.dev (2021)
