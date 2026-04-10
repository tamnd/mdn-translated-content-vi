---
title: "WorkerGlobalScope: phương thức setInterval()"
short-title: setInterval()
slug: Web/API/WorkerGlobalScope/setInterval
page-type: web-api-instance-method
browser-compat: api.setInterval
---

{{APIRef("HTML DOM")}} {{AvailableInWorkers("window_and_worker")}}

> [!WARNING]
> Khi tham số `code` được sử dụng, phương thức này động thực thi giá trị của nó dưới dạng JavaScript.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có khả năng là vector cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](/en-US/docs/Web/API/Window/setInterval#security_considerations) trong `Window.setInterval()` để biết thêm thông tin.

Phương thức **`setInterval()`** của giao diện {{domxref("WorkerGlobalScope")}} gọi lặp lại một hàm hoặc thực thi một đoạn mã, với một khoảng thời gian cố định giữa mỗi lần gọi.

Nó thường được sử dụng để thiết lập delay cho các hàm được thực thi lặp đi lặp lại, chẳng hạn như animations.
Bạn có thể hủy interval bằng cách sử dụng {{domxref("WorkerGlobalScope.clearInterval", "clearInterval()")}}.
Xem {{domxref("Window.setInterval()")}} để biết thêm thông tin.

Lưu ý rằng nếu bạn muốn hàm của mình được gọi _một lần_ sau khoảng thời gian đã chỉ định, hãy sử dụng {{domxref("WorkerGlobalScope.setTimeout", "setTimeout()")}}.

## Cú pháp

```js-nolint
setInterval(code)
setInterval(code, delay)

setInterval(func)
setInterval(func, delay)
setInterval(func, delay, param1)
setInterval(func, delay, param1, param2)
setInterval(func, delay, param1, param3, /* …, */ paramN)
```

### Tham số

- `func`
  - : Một {{jsxref("function")}} cần được thực thi mỗi `delay` mili giây.
    Lần thực thi đầu tiên xảy ra sau `delay` mili giây.
- `code`
  - : Một {{domxref("TrustedScript")}} hoặc một chuỗi mã tùy ý được biên dịch và thực thi mỗi `delay` mili giây.
    Điều này có thể được sử dụng thay vì truyền một hàm, nhưng _không được khuyến khích_ vì cùng lý do khiến việc sử dụng {{jsxref("Global_Objects/eval", "eval()")}} trở thành rủi ro bảo mật.
- `delay` {{optional_inline}}
  - : Thời gian delay giữa các lần thực thi hàm hoặc mã được chỉ định, tính bằng mili giây.
    Mặc định là 0 nếu không được chỉ định.
    Xem [Hạn chế về delay](/en-US/docs/Web/API/Window/setInterval#delay_restrictions) trong `Window.setInterval` để biết chi tiết về phạm vi giá trị `delay` được phép.
- `param1`, …, `paramN` {{optional_inline}}
  - : Các đối số bổ sung được truyền qua cho hàm được chỉ định bởi _func_ sau khi bộ đếm thời gian hết hạn.

### Giá trị trả về

Một số nguyên dương (thường trong khoảng từ 1 đến 2.147.483.647) xác định duy nhất bộ đếm interval được tạo bởi lời gọi.

Định danh này, thường được gọi là "interval ID", có thể được truyền vào {{domxref("WorkerGlobalScope.clearInterval", "clearInterval()")}} để dừng việc thực thi lặp lại của hàm được chỉ định.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : `code` không thể được phân tích cú pháp dưới dạng script.
- {{jsxref("TypeError")}}
  - : Ném ra nếu tham số `code` được đặt thành một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có policy mặc định nào được định nghĩa.
    Nó cũng được ném ra nếu tham số đầu tiên không phải là một trong các kiểu được hỗ trợ: một hàm, chuỗi hoặc `TrustedScript`.

## Ví dụ

Xem {{domxref("Window.setInterval", "setInterval()")}} để biết ví dụ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- [Polyfill của `setInterval` cho phép truyền đối số cho callback trong `core-js`](https://github.com/zloirock/core-js#settimeout-and-setinterval)
- {{domxref("Window.setInterval()")}}
- {{domxref("WorkerGlobalScope.clearInterval()")}}
- {{domxref("WorkerGlobalScope.setTimeout()")}}
- {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()")}}
