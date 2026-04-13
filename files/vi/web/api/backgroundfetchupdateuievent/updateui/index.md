---
title: "BackgroundFetchUpdateUIEvent: phương thức updateUI()"
short-title: updateUI()
slug: Web/API/BackgroundFetchUpdateUIEvent/updateUI
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BackgroundFetchUpdateUIEvent.updateUI
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Phương thức **`updateUI()`** của giao diện {{domxref("BackgroundFetchUpdateUIEvent")}} cập nhật tiêu đề và biểu tượng trong giao diện người dùng để hiển thị trạng thái của một thao tác tìm nạp nền.

Phương thức này chỉ có thể được chạy một lần để thông báo cho người dùng về một thao tác tìm nạp thành công hoặc thất bại.

## Cú pháp

```js-nolint
updateUI()
updateUI(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa bất kỳ mục nào sau đây:
    - `icons` {{optional_inline}}
      - : Danh sách gồm một hoặc nhiều tài nguyên hình ảnh, chứa các biểu tượng để dùng trong giao diện người dùng. Một tài nguyên hình ảnh là một đối tượng chứa:
        - `src`
          - : Một chuỗi là URL của một hình ảnh.
        - `sizes` {{optional_inline}}
          - : Một chuỗi tương đương với thuộc tính `sizes` của phần tử {{HTMLElement("link")}}.
        - `type` {{optional_inline}}
          - : Một chuỗi chứa kiểu MIME của hình ảnh.
        - `label` {{optional_inline}}
          - : Một chuỗi cung cấp tên cho hình ảnh liên kết.

    - `title` {{optional_inline}}
      - : Một chuỗi chứa tiêu đề mới của giao diện người dùng.

### Giá trị trả về

Một {{jsxref("Promise")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu bất kỳ điều nào sau đây là đúng:
    - Thuộc tính {{domxref("Event.isTrusted","isTrusted")}} là `false`.
    - Cờ cập nhật UI của {{domxref("BackgroundFetchUpdateUIEvent")}} đã được thiết lập, cho biết phương thức `updateUI()` đã được gọi trước đó.
    - {{domxref("BackgroundFetchUpdateUIEvent")}} không còn hoạt động.

## Ví dụ

Ví dụ sau minh họa việc cập nhật giao diện người dùng bằng tiêu đề và biểu tượng hình ảnh khi thao tác tìm nạp thành công.

```js
addEventListener("backgroundfetchsuccess", (event) => {
  event.updateUI({
    title: "Episode 5 ready to listen!",
    icon: {
      src: "path/to/success.ico",
      sizes: "16x16 32x32 64x64",
    },
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
