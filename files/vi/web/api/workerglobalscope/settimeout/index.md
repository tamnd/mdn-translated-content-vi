---
title: "WorkerGlobalScope: phương thức setTimeout()"
short-title: setTimeout()
slug: Web/API/WorkerGlobalScope/setTimeout
page-type: web-api-instance-method
browser-compat: api.setTimeout
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers("worker")}}

> [!WARNING]
> Khi tham số `code` được sử dụng, phương thức này động thực thi giá trị của nó dưới dạng JavaScript.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có khả năng là vector cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](/en-US/docs/Web/API/Window/setTimeout#security_considerations) trong `Window.setTimeout()` để biết thêm thông tin.

Phương thức **`setTimeout()`** của giao diện {{domxref("WorkerGlobalScope")}} thiết lập một bộ đếm thời gian sẽ thực thi một hàm hoặc đoạn mã được chỉ định sau khi bộ đếm thời gian hết hạn.

## Cú pháp

```js-nolint
setTimeout(code)
setTimeout(code, delay)

setTimeout(func)
setTimeout(func, delay)
setTimeout(func, delay, param1)
setTimeout(func, delay, param1, param2)
setTimeout(func, delay, param1, param2, /* …, */ paramN)
```

### Tham số

- `func`
  - : Một {{jsxref("function")}} cần được thực thi sau khi bộ đếm thời gian hết hạn.
- `code`
  - : Một {{domxref("TrustedScript")}} hoặc một chuỗi mã tùy ý được biên dịch và thực thi mỗi `delay` mili giây.
    Điều này có thể được sử dụng thay vì truyền một hàm, nhưng _không được khuyến khích_ vì cùng lý do khiến việc sử dụng {{jsxref("Global_Objects/eval", "eval()")}} trở thành rủi ro bảo mật.
- `delay` {{optional_inline}}
  - : Thời gian mà bộ đếm thời gian nên chờ trước khi thực thi hàm hoặc mã được chỉ định, tính bằng mili giây.
    Mặc định là 0 nếu không được chỉ định.

    Lưu ý:
    - Delay có giá trị tối đa là 2147483647 ms — chỉ định các giá trị lớn hơn có thể dẫn đến tràn hoặc giá trị 0 được sử dụng.
      Xem [giá trị delay tối đa](/en-US/docs/Web/API/Window/setTimeout#maximum_delay_value) để biết thêm thông tin.
    - Delay thực tế có thể dài hơn so với thiết lập.
      Ví dụ: thiết lập `delay` là 0 sẽ thực thi trong chu kỳ sự kiện tiếp theo thay vì "ngay lập tức".
      Xem [Lý do cho delays dài hơn so với chỉ định](/en-US/docs/Web/API/Window/setTimeout#reasons_for_longer_delays_than_specified) để biết thêm thông tin.
    - Nếu giá trị không phải là một số, [type coercion](/en-US/docs/Glossary/Type_coercion) ngầm định được thực hiện trên giá trị để chuyển đổi nó thành một số.
      Điều này có thể dẫn đến các kết quả bất ngờ và đáng ngạc nhiên — xem [Các giá trị delay không phải số được ngầm định chuyển đổi thành số](/en-US/docs/Web/API/Window/setTimeout#non-number_delay_values_are_silently_coerced_into_numbers) để biết ví dụ.

- `param1`, …, `paramN` {{optional_inline}}
  - : Các đối số bổ sung được truyền qua cho hàm được chỉ định bởi `func`.

### Giá trị trả về

Một số nguyên dương (thường trong khoảng từ 1 đến 2.147.483.647) xác định duy nhất bộ đếm thời gian được tạo bởi lời gọi.
Định danh này, thường được gọi là "timeout ID", có thể được truyền vào {{domxref("Window.clearTimeout","clearTimeout()")}} để hủy bộ đếm thời gian.

Trong cùng một môi trường global (ví dụ: một window hoặc worker cụ thể), timeout ID được đảm bảo không được sử dụng lại cho bất kỳ bộ đếm thời gian mới nào miễn là bộ đếm thời gian ban đầu vẫn hoạt động.
Tuy nhiên, các môi trường global riêng biệt duy trì các nhóm timer ID độc lập của riêng chúng.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : `code` không thể được phân tích cú pháp dưới dạng script.
- {{jsxref("TypeError")}}
  - : Ném ra nếu tham số `code` được đặt thành một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có policy mặc định nào được định nghĩa.
    Nó cũng được ném ra nếu tham số đầu tiên không phải là một trong các kiểu được hỗ trợ: một hàm, chuỗi hoặc `TrustedScript`.

## Mô tả

Xem {{domxref("Window.setTimeout()")}} để biết mô tả chi tiết.

## Ví dụ

Xem {{domxref("Window.setTimeout()")}} để biết ví dụ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- [Polyfill của `setTimeout` cho phép truyền đối số cho callback trong `core-js`](https://github.com/zloirock/core-js#settimeout-and-setinterval)
- {{domxref("Window.setTimeout()")}}
- {{domxref("WorkerGlobalScope.clearTimeout()")}}
- {{domxref("WorkerGlobalScope.setInterval()")}}
- {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()")}}
- {{domxref("WorkerGlobalScope.queueMicrotask()")}}
