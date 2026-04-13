---
title: BackgroundFetchRegistration
slug: Web/API/BackgroundFetchRegistration
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Giao diện **`BackgroundFetchRegistration`** của {{domxref('Background Fetch API','','',' ')}} biểu diễn một tác vụ tìm nạp nền riêng lẻ.

Một thực thể `BackgroundFetchRegistration` được trả về bởi các phương thức {{domxref("BackgroundFetchManager.fetch()")}} hoặc {{domxref("BackgroundFetchManager.get()")}}, vì vậy giao diện này không có hàm khởi tạo.

{{InheritanceDiagram}}

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính từ phần tử cha của nó, {{domxref("EventTarget")}}._

- {{domxref("BackgroundFetchRegistration.id")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi chứa ID của tác vụ tìm nạp nền.
- {{domxref("BackgroundFetchRegistration.uploadTotal")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("number")}} chứa tổng số byte sẽ được tải lên.
- {{domxref("BackgroundFetchRegistration.uploaded")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("number")}} chứa kích thước theo byte đã được gửi thành công, ban đầu là `0`.
- {{domxref("BackgroundFetchRegistration.downloadTotal")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("number")}} chứa tổng kích thước theo byte của lượt tải xuống này. Đây là giá trị được đặt khi tác vụ tìm nạp nền được đăng ký, hoặc `0`.
- {{domxref("BackgroundFetchRegistration.downloaded")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("number")}} chứa kích thước theo byte đã được tải xuống, ban đầu là `0`.
- {{domxref("BackgroundFetchRegistration.result")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Ban đầu trả về một chuỗi rỗng; khi hoàn tất sẽ là chuỗi `"success"` hoặc `"failure"`.
- {{domxref("BackgroundFetchRegistration.failureReason")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi có giá trị cho biết nguyên nhân khiến tác vụ tìm nạp nền thất bại. Có thể là một trong các giá trị sau: `""`, `"aborted"`, `"bad-status"`, `"fetch-error"`, `"quota-exceeded"`, `"download-total-exceeded"`.
- {{domxref("BackgroundFetchRegistration.recordsAvailable")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("boolean")}} cho biết cờ `recordsAvailable` có được đặt hay không.

## Phương thức thực thể

_Cũng kế thừa các phương thức từ phần tử cha của nó, {{domxref("EventTarget")}}._

- {{domxref("BackgroundFetchRegistration.abort()")}} {{Experimental_Inline}}
  - : Hủy tác vụ tìm nạp nền. Trả về một {{jsxref("Promise")}} phân giải thành `true` nếu việc tìm nạp được hủy thành công.
- {{domxref("BackgroundFetchRegistration.match()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("BackgroundFetchRecord")}} duy nhất, là kết quả khớp đầu tiên cho các đối số.
- {{domxref("BackgroundFetchRegistration.matchAll()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("BackgroundFetchRecord")}} chứa các yêu cầu và phản hồi.

## Sự kiện

_Cũng kế thừa các sự kiện từ phần tử cha của nó, {{domxref("EventTarget")}}._

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này.

- {{domxref("BackgroundFetchRegistration/progress_event", "progress")}} {{Experimental_Inline}}
  - : Được kích hoạt khi có thay đổi ở bất kỳ thuộc tính nào sau đây:
    {{domxref("BackgroundFetchRegistration.uploaded", "uploaded")}},
    {{domxref("BackgroundFetchRegistration.downloaded", "downloaded")}},
    {{domxref("BackgroundFetchRegistration.result", "result")}} hoặc
    {{domxref("BackgroundFetchRegistration.failureReason", "failureReason")}}.

## Ví dụ

Đoạn mã sau tạo một `BackgroundFetchRegistration` có tên `bgFetch`, với `id` là `"my-fetch"`.

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

Ghi {{domxref("BackgroundFetchRegistration.id","id")}} ra console sẽ trả về `"my-fetch"`.

```js
console.log(bgFetch.id); // "my-fetch"
```

Phương thức {{domxref("BackgroundFetchRegistration.match","match()")}} có thể được dùng để tìm một {{domxref("BackgroundFetchRecord")}} cụ thể trong số các bản ghi thuộc đăng ký này.

```js
bgFetch.match("/ep-5.mp3").then(async (record) => {
  if (!record) {
    console.log("No record found");
    return;
  }

  console.log(`Here's the request`, record.request);
  const response = await record.responseReady;
  console.log(`And here's the response`, response);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
