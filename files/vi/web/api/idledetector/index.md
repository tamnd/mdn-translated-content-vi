---
title: IdleDetector
slug: Web/API/IdleDetector
page-type: web-api-interface
status:
  - experimental
browser-compat: api.IdleDetector
---

{{securecontext_header}}{{APIRef("Idle Detection API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`IdleDetector`** của {{domxref('idle_detection_api','Idle Detection API','','true')}} cung cấp các phương thức và sự kiện để phát hiện hoạt động của người dùng trên thiết bị hoặc màn hình.

Giao diện này yêu cầu ngữ cảnh bảo mật.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("IdleDetector.IdleDetector", "IdleDetector()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `IdleDetector` mới.

## Thuộc tính phiên bản

- {{domxref("IdleDetector.userState")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một chuỗi cho biết người dùng có tương tác với màn hình hoặc thiết bị trong ngưỡng thời gian cung cấp cho `start()` hay không, một trong hai giá trị `"active"` hoặc `"idle"`. Thuộc tính này trả về `null` trước khi `start()` được gọi.
- {{domxref("IdleDetector.screenState")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một chuỗi cho biết màn hình có bị khóa hay không, một trong hai giá trị `"locked"` hoặc `"unlocked"`. Thuộc tính này trả về `null` trước khi `start()` được gọi.

## Sự kiện

- {{domxref("IdleDetector.change_event", "change")}} {{Experimental_Inline}}
  - : Được gọi khi giá trị của `userState` hoặc `screenState` thay đổi.

## Phương thức tĩnh

- {{domxref("IdleDetector/requestPermission_static", "IdleDetector.requestPermission()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref('Promise')}} phân giải khi người dùng đã chọn có cấp quyền truy cập trạng thái rảnh rỗi cho nguồn gốc hay không. Phân giải thành `"granted"` nếu chấp nhận và `"denied"` nếu từ chối.

## Phương thức phiên bản

- {{domxref("IdleDetector.start()")}} {{Experimental_Inline}}
  - : Trả về một `Promise` phân giải khi bộ phát hiện bắt đầu lắng nghe các thay đổi trong trạng thái rảnh rỗi của người dùng. `userState` và `screenState` được gán giá trị ban đầu. Phương thức này nhận một đối tượng `options` tùy chọn với `threshold` tính bằng mili giây xác định thời gian không hoạt động cần báo cáo và `signal` cho `AbortSignal` để hủy bộ phát hiện rảnh rỗi.

## Ví dụ

Ví dụ dưới đây minh họa cách tạo bộ phát hiện và ghi lại các thay đổi về trạng thái rảnh rỗi của người dùng. Một nút được dùng để kích hoạt người dùng trước khi yêu cầu quyền.

```js
const controller = new AbortController();
const signal = controller.signal;

startButton.addEventListener("click", async () => {
  if ((await IdleDetector.requestPermission()) !== "granted") {
    console.error("Idle detection permission denied.");
    return;
  }

  try {
    const idleDetector = new IdleDetector();
    idleDetector.addEventListener("change", () => {
      const userState = idleDetector.userState;
      const screenState = idleDetector.screenState;
      console.log(`Idle change: ${userState}, ${screenState}.`);
    });

    await idleDetector.start({
      threshold: 60_000,
      signal,
    });
    console.log("IdleDetector is active.");
  } catch (err) {
    // Deal with initialization errors like permission denied,
    // running outside of top-level frame, etc.
    console.error(err.name, err.message);
  }
});

stopButton.addEventListener("click", () => {
  controller.abort();
  console.log("IdleDetector is stopped.");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
