---
title: WindowSharedStorage
slug: Web/API/WindowSharedStorage
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.WindowSharedStorage
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`WindowSharedStorage`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho bộ nhớ dùng chung cho một nguồn gốc cụ thể trong ngữ cảnh duyệt web tiêu chuẩn.

`WindowSharedStorage` được truy cập thông qua {{domxref("Window.sharedStorage")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("WindowSharedStorage.worklet", "worklet")}} {{deprecated_inline}}
  - : Chứa phiên bản {{domxref("SharedStorageWorklet")}} đại diện cho worklet bộ nhớ dùng chung cho nguồn gốc hiện tại. `SharedStorageWorklet` bao gồm phương thức {{domxref("Worklet.addModule", "addModule()")}}, được sử dụng để thêm module vào worklet bộ nhớ dùng chung.

## Phương thức phiên bản

_`WindowSharedStorage` kế thừa các thuộc tính từ giao diện cha {{domxref("SharedStorage")}}._

- {{domxref("WindowSharedStorage.run", "run()")}} {{Deprecated_Inline}}
  - : Thực thi thao tác [Run output gate](/en-US/docs/Web/API/Shared_Storage_API#run) đã được đăng ký trong module được thêm vào {{domxref("SharedStorageWorklet")}} của nguồn gốc hiện tại.
- {{domxref("WindowSharedStorage.selectURL", "selectURL()")}} {{Deprecated_Inline}}
  - : Thực thi thao tác [URL Selection output gate](/en-US/docs/Web/API/Shared_Storage_API#url_selection) đã được đăng ký trong module được thêm vào {{domxref("SharedStorageWorklet")}} của nguồn gốc hiện tại.

## Ví dụ

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
