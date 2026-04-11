---
title: "Navigator: phương thức sendBeacon()"
short-title: sendBeacon()
slug: Web/API/Navigator/sendBeacon
page-type: web-api-instance-method
browser-compat: api.Navigator.sendBeacon
---

{{APIRef("HTML DOM")}}

**`navigator.sendBeacon()`**
phương thức {{glossary("Asynchronous", "asynchronously")}} gửi yêu cầu [HTTP POST](/en-US/docs/Web/HTTP/Reference/Methods/POST) chứa một lượng nhỏ dữ liệu đến máy chủ web.

Nó được thiết kế để sử dụng cho
gửi dữ liệu phân tích đến máy chủ web và tránh một số vấn đề với
các kỹ thuật truyền thống để gửi phân tích, chẳng hạn như việc sử dụng
{{domxref("XMLHttpRequest","XMLHttpRequest")}}.

> [!LƯU Ý]
> Đối với các trường hợp sử dụng cần khả năng gửi yêu cầu bằng các phương thức không phải `POST` hoặc thay đổi bất kỳ thuộc tính yêu cầu nào hoặc cần quyền truy cập vào phản hồi của máy chủ, thay vào đó hãy sử dụng phương thức [`fetch()`](/en-US/docs/Web/API/Window/fetch) với [`keepalive`](/en-US/docs/Web/API/RequestInit#keepalive) được đặt thành true.

## Cú pháp

```js-nolint
sendBeacon(url)
sendBeacon(url, data)
```

### Thông số

- `url`
  - : URL sẽ nhận _data_. Có thể là tương đối hoặc tuyệt đối.
- `data` {{Optional_inline}}
  - : {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, {{domxref("Blob")}},
    một chuỗi ký tự hoặc đối tượng, {{domxref("FormData")}} hoặc {{domxref("URLSearchParams")}}
    đối tượng chứa dữ liệu cần gửi.

### Giá trị trả về

Trả về `true` nếu
{{glossary("user agent")}} đã xếp hàng thành công `data` để chuyển.
Nếu không, nó sẽ trả về `false`.

## Sự miêu tả

Phương pháp này dành cho mã phân tích và chẩn đoán để gửi dữ liệu đến máy chủ.

Một vấn đề với việc gửi phân tích là một trang web thường muốn gửi phân tích
khi người dùng kết thúc một trang: ví dụ: khi người dùng điều hướng
sang trang khác. Trong trường hợp này, trình duyệt có thể sắp dỡ trang,
và trong trường hợp đó trình duyệt có thể chọn không gửi không đồng bộ
yêu cầu {{domxref("XMLHttpRequest")}}.

Trước đây, các trang web đã cố gắng trì hoãn việc tải trang đủ lâu để gửi dữ liệu. Để làm điều này họ có
sử dụng cách giải quyết như:

- Gửi dữ liệu bằng lệnh gọi `XMLHttpRequest` đồng bộ chặn.
- Tạo phần tử {{HTMLElement("img")}} và thiết lập `src` cho phần tử đó. Hầu hết các tác nhân người dùng sẽ trì hoãn việc dỡ tải để tải hình ảnh.
- Tạo vòng lặp no-op trong vài giây.

Tất cả các phương pháp này đều chặn việc dỡ tài liệu, làm chậm quá trình điều hướng đến trang tiếp theo.
Trang tiếp theo không thể làm gì để tránh điều này, vì vậy trang mới có vẻ như
chậm, mặc dù đó là lỗi của trang trước.

Với phương thức `sendBeacon()`, dữ liệu được truyền không đồng bộ khi người dùng
đại lý có cơ hội để làm như vậy mà không trì hoãn việc dỡ hàng hoặc điều hướng tiếp theo.
Điều này có nghĩa là:

- Dữ liệu được gửi đáng tin cậy
- Nó được gửi không đồng bộ
- Nó không ảnh hưởng đến việc tải trang tiếp theo

Dữ liệu được gửi dưới dạng yêu cầu [HTTP POST](/en-US/docs/Web/HTTP/Reference/Methods/POST).

> [!LƯU Ý]
> Phương pháp `navigator.sendBeacon()` có giới hạn kích thước tải trọng [spec-defined](https://fetch.spec.whatwg.org/#:~:text=length.-,If%20the%20sum%20of%20contentLength%20and%20inflightKeepaliveBytes%20is%20greater%20than%2064%20kibibytes%2C%20then%20return%20a%20network%20error.,-The) là khoảng 64 KiB. Nếu vượt quá giới hạn này, yêu cầu sẽ thất bại. Để truyền dữ liệu lớn hơn, hãy cân nhắc sử dụng `fetch()` thay thế.

### Gửi phân tích vào cuối phiên

Các trang web thường muốn gửi phân tích hoặc chẩn đoán đến máy chủ khi người dùng kết thúc trang.
Cách đáng tin cậy nhất để thực hiện việc này là gửi dữ liệu về sự kiện [`visibilitychange`](/en-US/docs/Web/API/Document/visibilitychange_event):

```js
document.addEventListener("visibilitychange", () => {
  if (document.visibilityState === "hidden") {
    navigator.sendBeacon("/log", analyticsData);
  }
});
```

#### Tránh dỡ và trước khi dỡ

Trước đây, nhiều trang web đã sử dụng [`unload`](/en-US/docs/Web/API/Window/unload_event)
hoặc sự kiện [`beforeunload`](/en-US/docs/Web/API/Window/beforeunload_event) để gửi phân tích vào cuối phiên.
Tuy nhiên, điều này cực kỳ không đáng tin cậy. Trong nhiều trường hợp, đặc biệt là trên thiết bị di động, trình duyệt sẽ không kích hoạt
Sự kiện `unload`, `beforeunload` hoặc `pagehide`. Ví dụ: những sự kiện này sẽ không kích hoạt trong tình huống sau:

1. Người dùng tải trang và tương tác với nó.
2. Khi hoàn tất, họ chuyển sang một ứng dụng khác thay vì đóng tab.
3. Sau đó, họ đóng ứng dụng trình duyệt bằng trình quản lý ứng dụng của điện thoại.

Ngoài ra, sự kiện `unload` không tương thích với bộ đệm ẩn tiến/lùi ([bfcache](https://web.dev/articles/bfcache))
được thực hiện trong các trình duyệt hiện đại. Một số trình duyệt, chẳng hạn như Firefox, xử lý tính không tương thích này bằng cách loại trừ các trang khỏi bfcache nếu chúng chứa trình xử lý dỡ tải,
do đó làm tổn hại đến hiệu suất. Những người khác, chẳng hạn như Safari và Chrome trên Android, xử lý vấn đề này bằng cách không kích hoạt sự kiện `unload` khi người dùng điều hướng đến một trang khác trong cùng một tab.

Firefox cũng sẽ loại trừ các trang khỏi bfcache nếu chúng chứa trình xử lý `beforeunload`.

#### Sử dụng pagehide làm dự phòng

Để hỗ trợ các trình duyệt không triển khai `visibilitychange`, hãy sử dụng sự kiện [`pagehide`](/en-US/docs/Web/API/Window/pagehide_event).
Giống như `beforeunload` và `unload`, sự kiện này không được kích hoạt một cách chắc chắn, đặc biệt là trên thiết bị di động. Tuy nhiên, nó tương thích với bfcache.

## Ví dụ

Ví dụ sau chỉ định trình xử lý cho sự kiện {{domxref("document.visibilitychange_event", "visibilitychange")}}. Trình xử lý gọi `sendBeacon()` để gửi phân tích.

```js
document.addEventListener("visibilitychange", () => {
  if (document.visibilityState === "hidden") {
    navigator.sendBeacon("/log", analyticsData);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện [`visibilitychange`](/en-US/docs/Web/API/Document/visibilitychange_event).
- Trang tổng quan {{domxref("Beacon_API","Beacon API", "", "true")}}.
- [Don't lose user and app state, use Page Visibility](https://www.igvita.com/2015/11/20/dont-lose-user-and-app-state-use-page-visibility/) giải thích trong
  chi tiết lý do bạn nên sử dụng `visibilitychange` chứ không phải
  `beforeunload`/`unload`.
- [Page Lifecycle API](https://developer.chrome.com/docs/web-platform/page-lifecycle-api#developer-recommendations-for-each-state) đưa ra hướng dẫn các phương pháp xử lý tốt nhất
  hành vi vòng đời của trang trong ứng dụng web của bạn.
- [PageLifecycle.js](https://github.com/GoogleChromeLabs/page-lifecycle): thư viện JavaScript xử lý sự không nhất quán giữa các trình duyệt trong hành vi vòng đời của trang.
- [Back/forward cache](https://web.dev/articles/bfcache) giải thích bộ nhớ đệm tiến/lùi là gì và ý nghĩa của nó đối với các sự kiện khác nhau trong vòng đời của trang.
