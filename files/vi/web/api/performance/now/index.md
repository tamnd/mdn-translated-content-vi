---
title: "Performance: now() method"
short-title: now()
slug: Web/API/Performance/now
page-type: web-api-instance-method
browser-compat: api.Performance.now
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`performance.now()`** trả về một dấu thời gian độ phân giải cao tính bằng mili giây. Nó biểu thị thời gian đã trôi qua kể từ {{domxref("Performance.timeOrigin")}} (thời điểm điều hướng bắt đầu trong ngữ cảnh window, hoặc thời điểm worker được chạy trong ngữ cảnh {{domxref("Worker")}} và {{domxref("ServiceWorker")}}).

## Cú pháp

```js-nolint
now()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{domxref("DOMHighResTimeStamp")}} được đo bằng mili giây.

## Mô tả

### `Performance.now` so với `Date.now`

Không giống [`Date.now`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/now), các dấu thời gian do `performance.now()` trả về không bị giới hạn ở độ phân giải một mili giây. Thay vào đó, chúng biểu thị thời gian dưới dạng số dấu phẩy động với độ chính xác tới micro giây.

Ngoài ra, `Date.now()` có thể bị ảnh hưởng bởi điều chỉnh đồng hồ của hệ thống và người dùng, lệch đồng hồ, v.v. vì nó được tính tương đối với Unix epoch (1970-01-01T00:00:00Z) và phụ thuộc vào đồng hồ hệ thống.
Ngược lại, phương thức `performance.now()` tương đối với thuộc tính `timeOrigin`, là một [đồng hồ đơn điệu](https://w3c.github.io/hr-time/#dfn-monotonic-clock): thời gian hiện tại của nó không bao giờ giảm và không chịu tác động của các điều chỉnh đó.

### Các thay đổi đặc tả của `performance.now`

Ngữ nghĩa của phương thức `performance.now()` đã thay đổi giữa High Resolution Time Level 1 và Level 2.

| Thay đổi            | Level 1                                                                                       | Level 2                                                                                                                                                        |
| ------------------- | --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tính tương đối với  | [`performance.timing.navigationStart`](/en-US/docs/Web/API/PerformanceTiming/navigationStart) | {{domxref("Performance.timeOrigin")}}                                                                                                                          |
| Điều kiện kích hoạt | Tài liệu được fetch hoặc lời nhắc unload (nếu có).                                            | Tạo ngữ cảnh duyệt (nếu không có tài liệu trước đó), lời nhắc unload (nếu có), hoặc bắt đầu điều hướng (theo định nghĩa trong HTML, vài bước trước khi fetch). |

Phương thức `performance.now()` trước đây được tính tương đối với thuộc tính [`performance.timing.navigationStart`](/en-US/docs/Web/API/PerformanceTiming/navigationStart) từ đặc tả Navigation Timing. Điều này đã thay đổi và `performance.now()` hiện được tính tương đối với {{domxref("Performance.timeOrigin")}}, giúp tránh rủi ro do thay đổi đồng hồ khi so sánh dấu thời gian giữa các trang web.

```js
// Level 1 (có rủi ro do thay đổi đồng hồ)
currentTime = performance.timing.navigationStart + performance.now();

// Level 2 (không có rủi ro do thay đổi đồng hồ)
currentTime = performance.timeOrigin + performance.now();
```

### Có chạy trong lúc ngủ hay không

Đặc tả (Level 2) yêu cầu `performance.now()` phải tiếp tục tăng khi hệ điều hành ngủ hoặc khi tiến trình trình duyệt bị đóng băng theo cách khác. Có vẻ như chỉ các trình duyệt trên Windows vẫn tiếp tục tăng trong lúc ngủ. Các lỗi trình duyệt liên quan trên hệ điều hành khác:

- Chrome/Chromium ([bug](https://crbug.com/1206450))
- Firefox ([bug](https://bugzil.la/1709767))
- Safari/WebKit ([bug](https://webkit.org/b/225610))

Tùy vào trường hợp sử dụng, sự khác biệt này có thể quan trọng hoặc không. Ví dụ, nếu bạn đang đo các thao tác ngắn như tải một hình ảnh, trong thời gian đó hệ thống khó có khả năng ngủ, thì điều này có thể không gây ra vấn đề nào. Nếu bạn đang đo một thao tác dài, bạn có thể thấy {{jsxref("Date.now()")}} hữu ích hơn để tránh các giới hạn này, vì độ chính xác cao của `performance.now()` có lẽ cũng không còn quá quan trọng.

Thêm chi tiết cũng có thể được tìm thấy trong issue đặc tả [hr-time#115](https://github.com/w3c/hr-time/issues/115#issuecomment-1172985601).

## Yêu cầu bảo mật

Để bảo vệ chống lại tấn công dựa trên thời gian và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), `performance.now()` được làm thô đi tùy theo việc tài liệu có phải là {{domxref("Window.crossOriginIsolated","cross-origin isolated","","nocode")}} hay không.

- Độ phân giải trong ngữ cảnh cô lập: 5 micro giây
- Độ phân giải trong ngữ cảnh không cô lập: 100 micro giây

Bạn có thể dùng các thuộc tính {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}} để kiểm tra xem tài liệu có được cô lập cross-origin hay không:

```js
if (crossOriginIsolated) {
  // Dùng measureUserAgentSpecificMemory
}
```

## Ví dụ

### Dùng `performance.now()`

Để xác định đã trôi qua bao nhiêu thời gian kể từ một thời điểm cụ thể trong mã của bạn, bạn có thể làm như sau:

```js
const t0 = performance.now();
doSomething();
const t1 = performance.now();
console.log(`Call to doSomething took ${t1 - t0} milliseconds.`);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.timeOrigin")}}
