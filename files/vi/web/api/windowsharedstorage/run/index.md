---
title: "WindowSharedStorage: phương thức run()"
short-title: run()
slug: Web/API/WindowSharedStorage/run
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.WindowSharedStorage.run
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`run()`** của giao diện {{domxref("WindowSharedStorage")}} thực thi một [thao tác run](/en-US/docs/Web/API/SharedStorageRunOperation) đã được đăng ký trong module được thêm vào {{domxref("SharedStorageWorklet")}} của nguồn gốc hiện tại.

> [!NOTE]
> [Run output gate](/en-US/docs/Web/API/Shared_Storage_API#run) nhằm mục đích là một cách chung để xử lý một số dữ liệu bộ nhớ dùng chung.

## Cú pháp

```js-nolint
run(name)
run(name, options)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho tên của thao tác đã đăng ký trong module worklet bộ nhớ dùng chung. Phải khớp với tên được cung cấp cho thao tác khi nó được đăng ký với {{domxref("SharedStorageWorkletGlobalScope.register()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn có thể chứa các thuộc tính sau:
    - `data` {{optional_inline}}
      - : Một đối tượng đại diện cho bất kỳ dữ liệu nào cần thiết để thực thi thao tác.
    - `keepAlive` {{optional_inline}}
      - : Một giá trị boolean. Nếu đặt thành `true`, {{domxref("SharedStorageWorkletGlobalScope")}} của worklet liên quan được giữ sống và thao tác có thể chạy lại. Mặc định là `false`, nghĩa là {{domxref("SharedStorageWorkletGlobalScope")}} bị kết thúc sau khi thao tác chạy và không thể chạy lại.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn thành với `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu:
    - Module worklet chưa được thêm bằng {{domxref("Worklet.addModule", "addModule()")}}.
    - Bộ nhớ dùng chung bị vô hiệu hóa (ví dụ: thông qua cài đặt trình duyệt).
    - Trang web gọi không có Shared Storage API được đưa vào trong [quá trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.

## Ví dụ

```js
async function measureUniqueReach() {
  // Load the Shared Storage worklet
  await window.sharedStorage.worklet.addModule("reach-measurement-worklet.js");

  // Run the reach measurement operation
  await window.sharedStorage.run("reach-measurement", {
    data: { contentId: "1234" },
  });
}

measureUniqueReach();
```

Xem [Unique reach measurement](https://privacysandbox.google.com/private-advertising/private-aggregation/unique-reach) để được giải thích đầy đủ về ví dụ này. Xem [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
