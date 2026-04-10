---
title: "StorageManager: phương thức estimate()"
short-title: estimate()
slug: Web/API/StorageManager/estimate
page-type: web-api-instance-method
browser-compat: api.StorageManager.estimate
---

{{securecontext_header}}{{APIRef("Storage")}} {{AvailableInWorkers}}

Phương thức **`estimate()`** của giao diện {{domxref("StorageManager")}} hỏi Storage Manager xem origin hiện tại [origin](/en-US/docs/Glossary/Same-origin_policy) đang dùng bao nhiêu dung lượng lưu trữ (`usage`) và còn bao nhiêu dung lượng trống (`quota`).

Phương thức này hoạt động bất đồng bộ, vì vậy nó trả về một {{jsxref("Promise")}} được giải quyết khi thông tin có sẵn. Trình xử lý khi promise hoàn tất sẽ nhận một đối tượng chứa dữ liệu `usage` và `quota`.

## Cú pháp

```js-nolint
estimate()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} được giải quyết thành một đối tượng có các thuộc tính sau:

- `quota`
  - : Một giá trị số tính bằng byte, cung cấp xấp xỉ thận trọng về tổng dung lượng lưu trữ mà thiết bị hoặc máy tính của người dùng có sẵn cho origin hoặc web app. Có thể còn nhiều dung lượng hơn mức này, nhưng bạn không thể dựa vào điều đó.
- `usage`
  - : Một giá trị số tính bằng byte, xấp xỉ lượng dung lượng lưu trữ hiện đang được dùng bởi site hoặc web app, trên tổng dung lượng sẵn có như `quota` cho biết. Đơn vị là byte.
- `usageDetails` {{Non-standard_Inline}}
  - : Một đối tượng chứa phân tích `usage` theo hệ thống lưu trữ. Mọi thuộc tính được bao gồm sẽ có `usage` lớn hơn 0, và mọi hệ thống lưu trữ có `usage` bằng 0 sẽ bị loại khỏi đối tượng.

> [!NOTE]
> Các giá trị trả về không chính xác tuyệt đối: do nén, khử trùng lặp và làm mờ vì lý do bảo mật, chúng sẽ chỉ mang tính xấp xỉ.

Bạn có thể thấy rằng `quota` thay đổi giữa các origin. Sự thay đổi này dựa trên các yếu tố như:

- Tần suất người dùng truy cập
- Dữ liệu độ phổ biến của site công khai
- Tín hiệu mức độ tương tác của người dùng như đánh dấu trang, thêm vào màn hình chính, hoặc chấp nhận thông báo đẩy

### Ngoại lệ

- `TypeError`
  - : Được ném ra nếu không thể lấy shelf lưu trữ cục bộ. Ví dụ, nếu origin hiện tại là opaque origin hoặc nếu người dùng đã vô hiệu hóa lưu trữ.

## Ví dụ

Trong ví dụ này, chúng ta lấy các ước lượng về mức sử dụng và hiển thị cho người dùng phần trăm dung lượng lưu trữ hiện đang được dùng.

### HTML

```html
You're currently using about <span id="percent"></span>% of your estimated
storage quota (<span id="quota"></span>).
```

### JavaScript

```js
navigator.storage.estimate().then((estimate) => {
  document.getElementById("percent").textContent = (
    (estimate.usage / estimate.quota) *
    100
  ).toFixed(2);
  document.getElementById("quota").textContent =
    `${(estimate.quota / 1024 / 1024).toFixed(2)}MB`;
});
```

### Kết quả

{{ EmbedLiveSample('Examples', 600, 40) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Storage API](/en-US/docs/Web/API/Storage_API)
- {{domxref("Storage")}}, đối tượng được trả về bởi {{domxref("Window.localStorage")}}
- {{domxref("StorageManager")}}
- {{domxref("navigator.storage")}}
