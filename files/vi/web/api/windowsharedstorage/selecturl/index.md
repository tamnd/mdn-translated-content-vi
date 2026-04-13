---
title: "WindowSharedStorage: phương thức selectURL()"
short-title: selectURL()
slug: Web/API/WindowSharedStorage/selectURL
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.WindowSharedStorage.selectURL
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`selectURL()`** của giao diện {{domxref("WindowSharedStorage")}} thực thi một [thao tác URL Selection](/en-US/docs/Web/API/SharedStorageSelectURLOperation) đã được đăng ký trong module được thêm vào {{domxref("SharedStorageWorklet")}} của nguồn gốc hiện tại.

> [!NOTE]
> [URL Selection output gate](/en-US/docs/Web/API/Shared_Storage_API#url_selection) được sử dụng để chọn một URL từ danh sách được cung cấp để hiển thị cho người dùng, dựa trên dữ liệu bộ nhớ dùng chung.

## Cú pháp

```js-nolint
selectURL(name, urls)
selectURL(name, urls, options)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho tên của thao tác đã đăng ký trong module worklet bộ nhớ dùng chung. Phải khớp với tên được cung cấp cho thao tác khi nó được đăng ký với {{domxref("SharedStorageWorkletGlobalScope.register()")}}.
- `urls`
  - : Một mảng các đối tượng đại diện cho các URL cần được chọn bởi thao tác URL Selection. Mỗi đối tượng chứa hai thuộc tính:
    - `url`
      - : Một chuỗi đại diện cho URL.
    - `reportingMetadata` {{optional_inline}}
      - : Một đối tượng chứa các thuộc tính trong đó tên là loại sự kiện và giá trị là các URL trỏ đến điểm đến báo cáo.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn có thể chứa các thuộc tính sau:
    - `data` {{optional_inline}}
      - : Một đối tượng đại diện cho bất kỳ dữ liệu nào cần thiết để thực thi thao tác.
    - `keepAlive` {{optional_inline}}
      - : Một giá trị boolean. Nếu đặt thành `true`, {{domxref("SharedStorageWorkletGlobalScope")}} của worklet liên quan được giữ sống.
    - `resolveToConfig` {{optional_inline}}
      - : Một giá trị boolean. Nếu đặt thành `true`, giá trị hoàn thành của {{jsxref("Promise")}} được trả về bởi `run()` sẽ là đối tượng {{domxref("FencedFrameConfig")}}. Mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn thành với đối tượng {{domxref("FencedFrameConfig")}} hoặc chuỗi đại diện cho URL, tùy thuộc vào giá trị của tùy chọn `resolveToConfig`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu:
    - Module worklet chưa được thêm bằng {{domxref("Worklet.addModule", "addModule()")}}.
    - `urls` trống hoặc vượt quá độ dài tối đa cho phép.
    - Thuộc tính `url` của đối tượng chứa URL không hợp lệ.
    - Bộ nhớ dùng chung bị vô hiệu hóa.
    - Trang web gọi không có Shared Storage API được đưa vào trong quá trình đăng ký privacy sandbox thành công.

## Ví dụ

### Kiểm tra A/B cơ bản

```js
// Randomly assigns a user to a group 0 or 1
function getExperimentGroup() {
  return Math.round(Math.random());
}

async function injectContent() {
  // Add the module to the shared storage worklet
  await window.sharedStorage.worklet.addModule("ab-testing-worklet.js");

  // Assign user to a random group (0 or 1) and store it in shared storage
  window.sharedStorage.set("ab-testing-group", getExperimentGroup(), {
    ignoreIfPresent: true,
  });

  // Run the URL selection operation
  const fencedFrameConfig = await window.sharedStorage.selectURL(
    "ab-testing",
    [
      { url: `https://your-server.example/content/default-content.html` },
      { url: `https://your-server.example/content/experiment-content-a.html` },
    ],
    {
      resolveToConfig: true,
    },
  );

  // Render the chosen URL into a fenced frame
  document.getElementById("content-slot").config = fencedFrameConfig;
}

injectContent();
```

Xem trang đích [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) để được hướng dẫn về ví dụ này và các liên kết đến các ví dụ khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
