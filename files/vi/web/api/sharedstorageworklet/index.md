---
title: SharedStorageWorklet
slug: Web/API/SharedStorageWorklet
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SharedStorageWorklet
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`SharedStorageWorklet`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho shared storage worklet của nguồn gốc hiện tại.

`SharedStorageWorklet` không có thuộc tính hoặc phương thức riêng. Thay vào đó, nó kế thừa phương thức {{domxref("Worklet.addModule", "addModule()")}} từ giao diện {{domxref("Worklet")}}. Phương thức này được dùng để thêm module.

Không giống như {{domxref("Worklet")}} thông thường:

- Nếu trang gọi không bao gồm Shared Storage API trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment), các lệnh gọi `sharedStorageWorklet.addModule()` sẽ bị từ chối.
- `SharedStorageWorklet` chỉ cho phép thêm một module duy nhất, vì lý do quyền riêng tư. Ngay cả khi đăng ký thành công, các lệnh gọi lặp lại `addModule()` trên cùng shared storage worklet sẽ bị từ chối.

`SharedStorageWorklet` được truy cập qua {{domxref("WindowSharedStorage.worklet")}}.

{{InheritanceDiagram}}

## Ví dụ

```js
// Ngẫu nhiên gán người dùng vào nhóm 0 hoặc 1
function getExperimentGroup() {
  return Math.round(Math.random());
}

async function injectContent() {
  // Thêm module vào shared storage worklet
  await window.sharedStorage.worklet.addModule("ab-testing-worklet.js");

  // Gán người dùng vào nhóm ngẫu nhiên (0 hoặc 1) và lưu trong shared storage
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

Xem trang chủ [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) để biết hướng dẫn về ví dụ này và các liên kết đến các ví dụ khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
