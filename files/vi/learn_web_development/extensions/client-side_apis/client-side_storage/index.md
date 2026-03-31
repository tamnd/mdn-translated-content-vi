---
title: Lưu trữ phía máy khách
slug: Learn_web_development/Extensions/Client-side_APIs/Client-side_storage
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics", "Learn_web_development/Extensions/Client-side_APIs/Third_party_APIs", "Learn_web_development/Extensions/Client-side_APIs")}}

Các trình duyệt web hiện đại hỗ trợ nhiều cách để các trang web lưu trữ dữ liệu trên máy tính của người dùng — với sự cho phép của người dùng — và sau đó truy xuất khi cần thiết. Điều này cho phép bạn lưu trữ dữ liệu lâu dài, lưu trang web hoặc tài liệu để sử dụng ngoại tuyến, duy trì cài đặt cụ thể của người dùng cho trang web của bạn, và nhiều hơn nữa. Bài viết này giải thích những điều cơ bản về cách thức hoạt động của chúng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, đặc biệt là <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">kiến thức cơ bản về đối tượng JavaScript</a> và kiến thức cốt lõi về API như <a href="/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting">lập trình DOM</a> và <a href="/en-US/docs/Learn_web_development/Core/Scripting/Network_requests">Yêu cầu mạng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các khái niệm về lưu trữ phía máy khách và các công nghệ chính để bật nó — Web Storage API, cookie, Cache API, và IndexedDB API.</li>
          <li>Các trường hợp sử dụng chính — duy trì trạng thái qua các lần tải lại, lưu trữ đăng nhập và dữ liệu cá nhân hóa người dùng, và làm việc cục bộ/ngoại tuyến.</li>
          <li>Sử dụng Web Storage để lưu trữ cặp khóa-giá trị đơn giản, được kiểm soát bởi JavaScript.</li>
          <li>Sử dụng IndexedDB để lưu trữ dữ liệu phức tạp, có cấu trúc hơn.</li>
          <li>Sử dụng Cache API và service worker cho các trường hợp sử dụng ngoại tuyến.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Lưu trữ phía máy khách?

Ở những nơi khác trong khu vực học tập MDN, chúng ta đã nói về sự khác biệt giữa [các trang web tĩnh](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview#static_sites) và [các trang web động](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview#dynamic_sites). Hầu hết các trang web lớn hiện đại đều là động — chúng lưu trữ dữ liệu trên máy chủ bằng cách sử dụng một loại cơ sở dữ liệu nào đó (lưu trữ phía máy chủ), sau đó chạy mã [phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side) để truy xuất dữ liệu cần thiết, chèn nó vào các mẫu trang tĩnh, và phục vụ kết quả HTML cho máy khách để được hiển thị bởi trình duyệt của người dùng.

Lưu trữ phía máy khách hoạt động theo nguyên tắc tương tự, nhưng có các cách sử dụng khác nhau. Nó bao gồm các API JavaScript cho phép bạn lưu trữ dữ liệu trên máy khách (tức là trên máy tính của người dùng) và sau đó truy xuất khi cần. Điều này có nhiều cách sử dụng riêng biệt, chẳng hạn như:

- Cá nhân hóa tùy chọn trang web (ví dụ: hiển thị lựa chọn widget tùy chỉnh của người dùng, bảng màu hoặc kích thước phông chữ).
- Lưu trữ hoạt động trang web trước đó (ví dụ: lưu trữ nội dung giỏ hàng từ phiên trước, ghi nhớ nếu người dùng đã đăng nhập trước đây).
- Lưu trữ dữ liệu và tài sản cục bộ để trang web sẽ tải nhanh hơn (và có thể ít tốn kém hơn), hoặc có thể sử dụng mà không cần kết nối mạng.
- Lưu trữ tài liệu được tạo bởi ứng dụng web cục bộ để sử dụng ngoại tuyến.

Thường thì lưu trữ phía máy khách và phía máy chủ được sử dụng cùng nhau. Ví dụ, bạn có thể tải xuống một loạt tệp nhạc (có thể được sử dụng bởi một trò chơi web hoặc ứng dụng trình phát nhạc), lưu chúng bên trong cơ sở dữ liệu phía máy khách, và phát chúng khi cần. Người dùng chỉ cần tải xuống các tệp nhạc một lần — trong các lần truy cập tiếp theo, chúng sẽ được truy xuất từ cơ sở dữ liệu thay thế.

> [!NOTE]
> Có giới hạn về lượng dữ liệu bạn có thể lưu trữ bằng cách sử dụng các API lưu trữ phía máy khách (có thể cả theo từng API và tích lũy); giới hạn chính xác thay đổi tùy thuộc vào trình duyệt và có thể dựa trên cài đặt người dùng. Xem [Hạn ngạch lưu trữ trình duyệt và tiêu chí trục xuất](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) để biết thêm thông tin.

### Cũ: Cookie

Khái niệm lưu trữ phía máy khách đã tồn tại từ lâu. Từ những ngày đầu của web, các trang web đã sử dụng [cookie](/en-US/docs/Web/HTTP/Guides/Cookies) để lưu trữ thông tin nhằm cá nhân hóa trải nghiệm người dùng trên các trang web. Chúng là hình thức lưu trữ phía máy khách phổ biến sớm nhất được sử dụng trên web.

Hiện nay, có các cơ chế dễ dàng hơn để lưu trữ dữ liệu phía máy khách, vì vậy chúng ta sẽ không dạy bạn cách sử dụng cookie trong bài viết này. Tuy nhiên, điều này không có nghĩa là cookie hoàn toàn vô dụng trên web ngày nay — chúng vẫn được sử dụng phổ biến để lưu trữ dữ liệu liên quan đến cá nhân hóa và trạng thái người dùng, ví dụ như ID phiên và token truy cập. Để biết thêm thông tin về cookie, hãy xem bài viết [Sử dụng cookie HTTP](/en-US/docs/Web/HTTP/Guides/Cookies) của chúng ta.

### Mới: Web Storage và IndexedDB

Các tính năng "dễ hơn" mà chúng ta đề cập ở trên như sau:

- [Web Storage API](/en-US/docs/Web/API/Web_Storage_API) cung cấp cơ chế để lưu trữ và truy xuất các mục dữ liệu nhỏ hơn bao gồm tên và giá trị tương ứng. Điều này hữu ích khi bạn chỉ cần lưu trữ một số dữ liệu đơn giản, như tên người dùng, liệu họ có đăng nhập không, màu nào cần sử dụng cho nền màn hình, v.v.
- [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) cung cấp cho trình duyệt một hệ thống cơ sở dữ liệu đầy đủ để lưu trữ dữ liệu phức tạp. Điều này có thể được sử dụng cho mọi thứ từ các bộ hồ sơ khách hàng hoàn chỉnh đến các loại dữ liệu phức tạp như tệp âm thanh hoặc video.

Bạn sẽ tìm hiểu thêm về các API này bên dưới.

### Cache API

{{domxref("Cache")}} API được thiết kế để lưu trữ các phản hồi HTTP cho các yêu cầu cụ thể, và rất hữu ích để làm những việc như lưu trữ tài sản trang web ngoại tuyến để trang web có thể được sử dụng tiếp theo mà không cần kết nối mạng. Cache thường được sử dụng kết hợp với [Service Worker API](/en-US/docs/Web/API/Service_Worker_API), mặc dù không nhất thiết phải như vậy.

Việc sử dụng Cache và Service Workers là một chủ đề nâng cao, và chúng ta sẽ không đề cập chi tiết trong bài viết này, mặc dù chúng ta sẽ trình bày một ví dụ trong phần [Lưu trữ tài sản ngoại tuyến](#offline_asset_storage) bên dưới.

## Lưu trữ dữ liệu đơn giản — web storage

[Web Storage API](/en-US/docs/Web/API/Web_Storage_API) rất dễ sử dụng — bạn lưu trữ các cặp tên/giá trị đơn giản (giới hạn ở chuỗi, số, v.v.) và truy xuất các giá trị này khi cần.

### Cú pháp cơ bản

Hãy để chúng ta hướng dẫn bạn cách thực hiện:

1. Đầu tiên, truy cập [mẫu trống web storage](https://mdn.github.io/learning-area/javascript/apis/client-side-storage/web-storage/index.html) trên GitHub (mở trong tab mới).
2. Mở bảng điều khiển JavaScript của công cụ phát triển trình duyệt của bạn.
3. Tất cả dữ liệu web storage của bạn được chứa trong hai cấu trúc giống đối tượng bên trong trình duyệt: {{domxref("Window.sessionStorage", "sessionStorage")}} và {{domxref("Window.localStorage", "localStorage")}}. Cái đầu tiên lưu trữ dữ liệu miễn là trình duyệt mở (dữ liệu bị mất khi trình duyệt đóng) và cái thứ hai lưu trữ dữ liệu ngay cả sau khi trình duyệt đóng và mở lại. Chúng ta sẽ sử dụng cái thứ hai trong bài viết này vì nó thường hữu ích hơn.

   Phương thức {{domxref("Storage.setItem()")}} cho phép bạn lưu mục dữ liệu trong storage — nó nhận hai tham số: tên của mục và giá trị của nó. Hãy thử gõ lệnh này vào bảng điều khiển JavaScript (thay đổi giá trị thành tên của bạn, nếu bạn muốn!):

   ```js
   localStorage.setItem("name", "Chris");
   ```

4. Phương thức {{domxref("Storage.getItem()")}} nhận một tham số — tên của mục dữ liệu bạn muốn truy xuất — và trả về giá trị của mục. Bây giờ hãy gõ các dòng này vào bảng điều khiển JavaScript của bạn:

   ```js
   let myName = localStorage.getItem("name");
   myName;
   ```

   Khi gõ dòng thứ hai, bạn sẽ thấy biến `myName` giờ chứa giá trị của mục dữ liệu `name`.

5. Phương thức {{domxref("Storage.removeItem()")}} nhận một tham số — tên của mục dữ liệu bạn muốn xóa — và xóa mục đó khỏi web storage. Gõ các dòng sau vào bảng điều khiển JavaScript của bạn:

   ```js
   localStorage.removeItem("name");
   myName = localStorage.getItem("name");
   myName;
   ```

   Dòng thứ ba bây giờ sẽ trả về `null` — mục `name` không còn tồn tại trong web storage nữa.

### Web Storage liên tục!

Một tính năng chính của web storage là nó được lưu trữ qua các lần tải lại trang (và thậm chí là sau khi trình duyệt tắt, trong trường hợp của `localStorage`). Hãy xem điều này trong hành động.

Mở lại [mẫu trống web storage](https://mdn.github.io/learning-area/javascript/apis/client-side-storage/web-storage/index.html). Lần này hãy nhìn vào [mã nguồn](https://github.com/mdn/learning-area/blob/main/javascript/apis/client-side-storage/web-storage/index.html).

## Lưu trữ dữ liệu phức tạp — IndexedDB

[IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) (đôi khi viết tắt là IDB) là một hệ thống cơ sở dữ liệu hoàn chỉnh có sẵn trong trình duyệt, trong đó bạn có thể lưu trữ dữ liệu phức tạp liên quan với các loại tùy ý. Điều này bao gồm các chuỗi và số, nhưng cũng là các đối tượng phức tạp như hồ sơ khách hàng, tệp nhạc hoặc video.

IndexedDB API cho phép bạn tạo cơ sở dữ liệu, sau đó tạo các kho đối tượng trong cơ sở dữ liệu đó. Các kho đối tượng giống như bảng trong cơ sở dữ liệu quan hệ, và mỗi kho đối tượng có thể chứa nhiều đối tượng. Để tìm hiểu thêm về IndexedDB API, xem [Sử dụng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB).

## Lưu trữ tài sản ngoại tuyến

Ví dụ ở trên đã cho thấy cách tạo một ứng dụng sẽ lưu trữ các tài sản lớn trong cơ sở dữ liệu IndexedDB, tránh cần phải tải chúng nhiều lần. Đây đã là một cải tiến tuyệt vời cho trải nghiệm người dùng, nhưng vẫn còn một điều còn thiếu — các tệp HTML, CSS và JavaScript chính vẫn cần được tải xuống mỗi khi trang web được truy cập, có nghĩa là nó sẽ không hoạt động khi không có kết nối mạng.

Đây là nơi [Service workers](/en-US/docs/Web/API/Service_Worker_API) và [Cache API](/en-US/docs/Web/API/Cache) liên quan đến nhau.

Một service worker là tệp JavaScript được đăng ký với một nguồn gốc cụ thể (trang web, hoặc một phần của trang web tại một miền nhất định) khi nó được truy cập bởi trình duyệt. Khi đã đăng ký, nó có thể kiểm soát các trang có sẵn tại nguồn gốc đó. Nó làm điều này bằng cách ngồi giữa một trang được tải và mạng, chặn các yêu cầu mạng hướng đến nguồn gốc đó.

Khi nó chặn một yêu cầu, nó có thể làm bất cứ điều gì bạn muốn với nó, nhưng ví dụ cổ điển là lưu các phản hồi mạng ngoại tuyến và sau đó cung cấp những phản hồi đó để đáp lại yêu cầu thay vì các phản hồi từ mạng. Thực chất, nó cho phép bạn làm cho một trang web hoạt động hoàn toàn ngoại tuyến.

Cache API là một cơ chế lưu trữ phía máy khách khác, được thiết kế để lưu các phản hồi HTTP, và hoạt động rất tốt với service workers.

### Ví dụ Service Worker

Hãy xem một ví dụ để giúp bạn hình dung điều này có thể trông như thế nào. Chúng ta đã tạo một phiên bản khác của ví dụ video store mà chúng ta thấy trong phần trước — điều này hoạt động giống hệt như vậy, ngoại trừ nó cũng lưu HTML, CSS và JavaScript trong Cache API thông qua một service worker, cho phép ví dụ chạy ngoại tuyến!

Xem [IndexedDB video store với service worker chạy trực tiếp](https://mdn.github.io/learning-area/javascript/apis/client-side-storage/cache-sw/video-store-offline/), và cũng [xem mã nguồn](https://github.com/mdn/learning-area/tree/main/javascript/apis/client-side-storage/cache-sw/video-store-offline).

#### Đăng ký service worker

Điều đầu tiên cần lưu ý là có một đoạn mã bổ sung được đặt trong tệp JavaScript chính. Đầu tiên, chúng ta thực hiện kiểm tra phát hiện tính năng để xem thành viên `serviceWorker` có sẵn trong đối tượng {{domxref("Navigator")}} không. Nếu điều này trả về true, thì chúng ta biết rằng ít nhất những điều cơ bản của service workers được hỗ trợ. Bên trong đây, chúng ta sử dụng phương thức {{domxref("ServiceWorkerContainer.register()")}} để đăng ký một service worker chứa trong tệp `sw.js` với nguồn gốc mà nó nằm trong, để nó có thể kiểm soát các trang trong cùng thư mục với nó, hoặc các thư mục con.

```js
// Register service worker to control making site work offline
if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register(
      "/learning-area/javascript/apis/client-side-storage/cache-sw/video-store-offline/sw.js",
    )
    .then(() => console.log("Service Worker Registered"));
}
```

#### Cài đặt service worker

Lần tiếp theo bất kỳ trang nào dưới sự kiểm soát của service worker được truy cập, service worker được cài đặt với trang đó, có nghĩa là nó sẽ bắt đầu kiểm soát nó. Khi điều này xảy ra, sự kiện `install` được kích hoạt đối với service worker.

Bên trong trình xử lý `install`, chúng ta sử dụng phương thức {{domxref("ExtendableEvent.waitUntil()")}} để báo hiệu rằng trình duyệt không nên hoàn thành cài đặt service worker cho đến khi promise bên trong nó được thực hiện thành công.

Đây là nơi chúng ta thấy Cache API hoạt động. Chúng ta sử dụng phương thức {{domxref("CacheStorage.open()")}} để mở một đối tượng cache mới. Sau đó chúng ta sử dụng phương thức {{domxref("Cache.addAll()")}} để lấy một loạt tài sản và thêm các phản hồi của chúng vào cache.

```js
self.addEventListener("install", (e) => {
  e.waitUntil(
    caches
      .open("video-store")
      .then((cache) =>
        cache.addAll([
          "/learning-area/javascript/apis/client-side-storage/cache-sw/video-store-offline/",
          "/learning-area/javascript/apis/client-side-storage/cache-sw/video-store-offline/index.html",
          "/learning-area/javascript/apis/client-side-storage/cache-sw/video-store-offline/index.js",
          "/learning-area/javascript/apis/client-side-storage/cache-sw/video-store-offline/style.css",
        ]),
      ),
  );
});
```

#### Phản hồi các yêu cầu tiếp theo

Với service worker được đăng ký và cài đặt với trang HTML của chúng ta, và tất cả các tài sản liên quan đã được thêm vào cache, chúng ta sẵn sàng hoạt động. Chúng ta thêm một trình lắng nghe khác vào phạm vi toàn cầu của service worker, chạy hàm xử lý khi sự kiện `fetch` được kích hoạt.

```js
self.addEventListener("fetch", (e) => {
  console.log(e.request.url);
  e.respondWith(
    caches.match(e.request).then((response) => response || fetch(e.request)),
  );
});
```

## Tóm tắt

Đó là tất cả cho bây giờ. Chúng ta hy vọng bạn thấy bổ ích phần giải thích về các công nghệ lưu trữ phía máy khách.

## Xem thêm

- [Web storage API](/en-US/docs/Web/API/Web_Storage_API)
- [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API)
- [Cookies](/en-US/docs/Web/HTTP/Guides/Cookies)
- [Service worker API](/en-US/docs/Web/API/Service_Worker_API)

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics", "Learn_web_development/Extensions/Client-side_APIs/Third_party_APIs", "Learn_web_development/Extensions/Client-side_APIs")}}
