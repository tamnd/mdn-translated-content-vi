---
title: Background Fetch API
slug: Web/API/Background_Fetch_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.BackgroundFetchManager
  - api.BackgroundFetchRegistration
  - api.BackgroundFetchRecord
spec-urls: https://wicg.github.io/background-fetch/
---

{{DefaultAPISidebar("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

**Background Fetch API** cung cấp một phương thức để quản lý các lượt tải xuống có thể mất nhiều thời gian, chẳng hạn như phim, tệp âm thanh và phần mềm.

## Khái niệm và cách dùng

Khi một ứng dụng web yêu cầu người dùng tải xuống các tệp lớn, điều này thường gây ra vấn đề là người dùng phải duy trì kết nối với trang cho đến khi việc tải xuống hoàn tất. Nếu họ mất kết nối, đóng thẻ hoặc điều hướng khỏi trang thì việc tải xuống sẽ dừng lại.

{{domxref("Background Synchronization API", "", "", "nocode")}} cung cấp một cách để service worker hoãn xử lý cho đến khi người dùng có kết nối; tuy nhiên, nó không thể được dùng cho các tác vụ chạy lâu như tải xuống một tệp lớn. Background Sync yêu cầu service worker phải tiếp tục hoạt động cho đến khi lệnh truy xuất hoàn tất, và để tiết kiệm pin cũng như ngăn các tác vụ không mong muốn diễn ra trong nền, trình duyệt cuối cùng sẽ chấm dứt tác vụ.

Background Fetch API giải quyết vấn đề này. Nó tạo ra một cách để nhà phát triển web yêu cầu trình duyệt thực hiện một số lượt truy xuất trong nền, ví dụ khi người dùng nhấn một nút để tải xuống một tệp video. Sau đó trình duyệt sẽ thực hiện các lượt truy xuất theo cách mà người dùng có thể nhìn thấy, hiển thị tiến trình cho họ và cung cấp cách hủy việc tải xuống. Khi việc tải xuống hoàn tất, trình duyệt sẽ mở service worker; tại thời điểm đó, ứng dụng của bạn có thể làm gì đó với phản hồi nếu cần.

Background Fetch API sẽ cho phép việc truy xuất diễn ra nếu người dùng bắt đầu quá trình khi đang ngoại tuyến. Khi họ kết nối lại, quá trình sẽ bắt đầu. Nếu người dùng lại ngoại tuyến, quá trình sẽ tạm dừng cho đến khi họ trực tuyến trở lại.

## Giao diện

- {{domxref("BackgroundFetchManager")}} {{Experimental_Inline}}
  - : Một ánh xạ mà khóa là các mã định danh background fetch và giá trị là các đối tượng {{domxref("BackgroundFetchRegistration")}}.
- {{domxref("BackgroundFetchRegistration")}} {{Experimental_Inline}}
  - : Biểu diễn một Background Fetch.
- {{domxref("BackgroundFetchRecord")}} {{Experimental_Inline}}
  - : Biểu diễn một yêu cầu truy xuất và phản hồi riêng lẻ.
- {{domxref("BackgroundFetchEvent")}} {{Experimental_Inline}}
  - : Kiểu sự kiện cho sự kiện {{domxref("ServiceWorkerGlobalScope.backgroundfetchabort_event", "backgroundfetchabort")}} và {{domxref("ServiceWorkerGlobalScope.backgroundfetchclick_event", "backgroundfetchclick")}}
- {{domxref("BackgroundFetchUpdateUIEvent")}} {{Experimental_Inline}}
  - : Kiểu sự kiện cho sự kiện {{domxref("ServiceWorkerGlobalScope.backgroundfetchsuccess_event", "backgroundfetchsuccess")}} và {{domxref("ServiceWorkerGlobalScope.backgroundfetchfail_event", "backgroundfetchfail")}}

### Phần mở rộng cho các giao diện khác

- {{domxref("ServiceWorkerRegistration.backgroundFetch")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tham chiếu đến một đối tượng {{domxref("BackgroundFetchManager")}}, đối tượng này quản lý các thao tác background fetch.
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchabort_event", "backgroundfetchabort")}} event {{Experimental_Inline}}
  - : Được kích hoạt khi một thao tác background fetch bị người dùng hoặc ứng dụng hủy.
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchclick_event", "backgroundfetchclick")}} event {{Experimental_Inline}}
  - : Được kích hoạt khi người dùng nhấp vào giao diện người dùng của một thao tác background fetch.
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchfail_event", "backgroundfetchfail")}} event {{Experimental_Inline}}
  - : Được kích hoạt khi ít nhất một trong các yêu cầu trong thao tác background fetch bị lỗi.
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchsuccess_event", "backgroundfetchsuccess")}} event {{Experimental_Inline}}
  - : Được kích hoạt khi tất cả các yêu cầu trong thao tác background fetch đều thành công.

## Ví dụ

Trước khi dùng Background Fetch, hãy kiểm tra khả năng hỗ trợ của trình duyệt.

```js
if (!("BackgroundFetchManager" in self)) {
  // Provide fallback downloading.
}
```

Việc dùng Background Fetch yêu cầu một service worker đã được đăng ký. Sau đó hãy gọi `backgroundFetch.fetch()` để thực hiện truy xuất. Lệnh này trả về một promise được giải quyết với một {{domxref("BackgroundFetchRegistration")}}.

Một background fetch có thể truy xuất nhiều tệp. Trong ví dụ của chúng ta, thao tác này yêu cầu một tệp MP3 và một tệp JPEG. Điều này cho phép một gói tệp mà người dùng nhìn thấy là một mục duy nhất (ví dụ một podcast và ảnh minh họa) được tải xuống cùng lúc.

```js
navigator.serviceWorker.ready.then(async (swReg) => {
  const bgFetch = await swReg.backgroundFetch.fetch(
    "my-fetch",
    ["/ep-5.mp3", "ep-5-artwork.jpg"],
    {
      title: "Episode 5: Interesting things.",
      icons: [
        {
          sizes: "300x300",
          src: "/ep-5-icon.png",
          type: "image/png",
        },
      ],
      downloadTotal: 60 * 1024 * 1024,
    },
  );
});
```

Bạn có thể tìm thấy thêm ví dụ mã và một bản demo trong [Introducing Background Fetch](https://developer.chrome.com/blog/background-fetch/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introducing Background Fetch](https://developer.chrome.com/blog/background-fetch/)
- [Background Fetch - HTTP 203](https://www.youtube.com/watch?v=cElAoxhQz6w)
