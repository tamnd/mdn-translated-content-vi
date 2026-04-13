---
title: "NavigationPreloadManager: phương thức setHeaderValue()"
short-title: setHeaderValue()
slug: Web/API/NavigationPreloadManager/setHeaderValue
page-type: web-api-instance-method
browser-compat: api.NavigationPreloadManager.setHeaderValue
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setHeaderValue()`** của giao diện {{domxref("NavigationPreloadManager")}} đặt giá trị của header {{HTTPHeader("Service-Worker-Navigation-Preload")}} sẽ được gửi cùng với các yêu cầu phát sinh từ thao tác {{domxref("Window/fetch", "fetch()")}} được thực hiện trong quá trình tải trước navigation của service worker. Phương thức trả về một {{jsxref("Promise")}} rỗng phân giải với `undefined`.

Sự hiện diện của header {{HTTPHeader("Service-Worker-Navigation-Preload")}} trong các yêu cầu tải trước cho phép máy chủ cấu hình tài nguyên được trả về khác nhau cho các yêu cầu fetch tải trước so với các yêu cầu fetch thông thường. Directive mặc định được đặt thành `true`: phương thức này cho phép cấu hình nhiều phản hồi khác nhau cho các yêu cầu tải trước.

> [!NOTE]
> Nếu một phản hồi khác có thể xuất hiện do đặt header này, máy chủ phải đặt `Vary: Service-Worker-Navigation-Preload` để đảm bảo các phản hồi khác nhau được lưu vào bộ nhớ đệm.

## Cú pháp

```js-nolint
setHeaderValue(value)
```

### Tham số

- `value`
  - : Một giá trị chuỗi tùy ý, mà máy chủ đích sử dụng để xác định những gì nên được trả về cho tài nguyên được yêu cầu.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với {{jsxref('undefined')}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Không có worker hoạt động nào liên kết với registration mà {{domxref("NavigationPreloadManager")}} này thuộc về.

## Ví dụ

Đoạn code dưới đây minh họa cách giá trị có thể được đặt.

```js
navigator.serviceWorker.ready
  .then((registration) =>
    registration.navigationPreload.setHeaderValue(newValue),
  )
  .then(() => console.log("Done!"))
  .catch((e) =>
    console.error(`NavigationPreloadManager not supported: ${e.message}`),
  );
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
