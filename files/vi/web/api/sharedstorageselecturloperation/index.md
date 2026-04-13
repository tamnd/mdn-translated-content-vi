---
title: SharedStorageSelectURLOperation
slug: Web/API/SharedStorageSelectURLOperation
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SharedStorageSelectURLOperation
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`SharedStorageSelectURLOperation`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho thao tác [URL Selection output gate](/en-US/docs/Web/API/Shared_Storage_API#url_selection).

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("SharedStorageSelectURLOperation.run", "run()")}} {{Deprecated_Inline}}
  - : Xác định cấu trúc mà phương thức `run()` được định nghĩa bên trong thao tác URL Selection output gate phải tuân theo.

## Ví dụ

Trong ví dụ này, một lớp tên `SelectURLOperation` được định nghĩa trong worklet và được đăng ký sử dụng {{domxref("SharedStorageWorkletGlobalScope.register()")}} với tên `ab-testing`. `SharedStorageSelectURLOperation` xác định cấu trúc mà lớp này cần tuân theo.

```js
// ab-testing-worklet.js
class SelectURLOperation {
  async run(urls, data) {
    // Đọc nhóm thực nghiệm của người dùng từ Shared Storage
    const experimentGroup = await this.sharedStorage.get("ab-testing-group");

    // Trả về số nhóm
    return experimentGroup;
  }
}

// Đăng ký thao tác
register("ab-testing", SelectURLOperation);
```

> [!NOTE]
> Có thể định nghĩa và đăng ký nhiều thao tác trong cùng script module shared storage worklet với các tên khác nhau; xem {{domxref("SharedStorageOperation")}} để biết ví dụ.

Trong ngữ cảnh duyệt web chính, thao tác `ab-testing` được gọi sử dụng phương thức {{domxref("WindowSharedStorage.selectURL()")}}:

```js
// Ngẫu nhiên gán người dùng vào nhóm 0 hoặc 1
function getExperimentGroup() {
  return Math.round(Math.random());
}

async function injectContent() {
  // Đăng ký Shared Storage worklet
  await window.sharedStorage.worklet.addModule("ab-testing-worklet.js");

  // Gán người dùng vào nhóm ngẫu nhiên (0 hoặc 1) và lưu trong Shared Storage
  window.sharedStorage.set("ab-testing-group", getExperimentGroup(), {
    ignoreIfPresent: true,
  });

  // Chạy thao tác URL selection
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

  // Render URL đã chọn vào fenced frame
  document.getElementById("content-slot").config = fencedFrameConfig;
}

injectContent();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
