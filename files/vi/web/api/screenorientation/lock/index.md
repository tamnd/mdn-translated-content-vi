---
title: "ScreenOrientation: phương thức lock()"
short-title: lock()
slug: Web/API/ScreenOrientation/lock
page-type: web-api-instance-method
browser-compat: api.ScreenOrientation.lock
---

{{APIRef("Screen Orientation")}}

Phương thức **`lock()`** của giao diện {{domxref("ScreenOrientation")}} khóa hướng của tài liệu chứa về hướng được chỉ định.

Thông thường việc khóa hướng chỉ được bật trên các thiết bị di động, và khi bối cảnh trình duyệt ở chế độ toàn màn hình.
Nếu khóa được hỗ trợ, thì nó phải hoạt động cho tất cả các giá trị tham số được liệt kê bên dưới.

## Cú pháp

```js-nolint
lock(orientation)
```

### Tham số

- `orientation`
  - : Loại khóa hướng. Một trong các giá trị sau:
    - `"any"`
      - : Bất kỳ loại nào trong `portrait-primary`, `portrait-secondary`, `landscape-primary` hoặc `landscape-secondary`.
    - `"natural"`
      - : Hướng tự nhiên của màn hình từ hệ điều hành bên dưới: `portrait-primary` hoặc `landscape-primary`.
    - `"landscape"`
      - : Hướng mà chiều rộng màn hình lớn hơn chiều cao màn hình.
        Tùy thuộc vào quy ước nền tảng, đây có thể là `landscape-primary`, `landscape-secondary`, hoặc cả hai.
    - `"portrait"`
      - : Hướng mà chiều cao màn hình lớn hơn chiều rộng màn hình.
        Tùy thuộc vào quy ước nền tảng, đây có thể là `portrait-primary`, `portrait-secondary`, hoặc cả hai.
    - `"portrait-primary"`
      - : Chế độ dọc "chính".
        Nếu hướng tự nhiên là chế độ dọc (chiều cao màn hình lớn hơn chiều rộng), đây sẽ giống với hướng tự nhiên, và tương ứng với góc 0 độ.
        Nếu hướng tự nhiên là chế độ ngang, thì user agent có thể chọn một trong hai hướng dọc làm `portrait-primary` và `portrait-secondary`; một trong số đó sẽ được gán góc 90 độ và cái kia sẽ có góc 270 độ.
    - `"portrait-secondary"`
      - : Hướng dọc thứ cấp.
        Nếu hướng tự nhiên là chế độ dọc, đây sẽ có góc 180 độ (nói cách khác, thiết bị úp ngược so với hướng tự nhiên).
        Nếu hướng tự nhiên là chế độ ngang, đây có thể là hướng nào do user agent chọn: hướng không được chọn cho `portrait-primary`.
    - `"landscape-primary"`
      - : Chế độ ngang "chính".
        Nếu hướng tự nhiên là chế độ ngang (chiều rộng màn hình lớn hơn chiều cao), đây sẽ giống với hướng tự nhiên, và tương ứng với góc 0 độ.
        Nếu hướng tự nhiên là chế độ dọc, thì user agent có thể chọn một trong hai hướng ngang làm `landscape-primary` với góc 90 hoặc 270 độ (`landscape-secondary` sẽ là hướng và góc kia).
    - `"landscape-secondary"`
      - : Chế độ ngang thứ cấp.
        Nếu hướng tự nhiên là chế độ ngang, hướng này úp ngược so với hướng tự nhiên, và sẽ có góc 180 độ.
        Nếu hướng tự nhiên là chế độ dọc, đây có thể là hướng nào do user agent chọn: hướng không được chọn cho `landscape-primary`.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết sau khi khóa thành công.

### Ngoại lệ

Promise có thể bị từ chối với các ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu không hoàn toàn hoạt động.

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái hiển thị của tài liệu bị ẩn hoặc nếu tài liệu bị cấm sử dụng tính năng (ví dụ: bằng cách bỏ qua từ khóa `allow-orientation-lock` của thuộc tính `sandbox` của phần tử `iframe`).

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu user agent không hỗ trợ khóa hướng màn hình với hướng cụ thể.

- `AbortError` {{domxref("DOMException")}}
  - : Được ném ra nếu có bất kỳ lệnh gọi phương thức `lock()` nào khác hoặc nếu {{domxref("ScreenOrientation/unlock","unlock()")}} được gọi khi promise khóa đang chờ xử lý.

## Ví dụ

Ví dụ này cho thấy cách khóa màn hình về hướng ngược lại với hướng hiện tại.
Lưu ý rằng ví dụ này chỉ hoạt động trên các thiết bị di động và các thiết bị khác hỗ trợ thay đổi hướng.

```html
<div id="example_container">
  <button id="fullscreen_button">Fullscreen</button>
  <button id="lock_button">Lock</button>
  <button id="unlock_button">Unlock</button>
  <textarea id="log" rows="7" cols="85"></textarea>
</div>
```

```js
const log = document.getElementById("log");

// Lock button: Lock the screen to the other orientation (rotated by 90 degrees)
const rotateBtn = document.querySelector("#lock_button");
rotateBtn.addEventListener("click", () => {
  log.textContent += `Lock pressed \n`;

  const oppositeOrientation = screen.orientation.type.startsWith("portrait")
    ? "landscape"
    : "portrait";
  screen.orientation
    .lock(oppositeOrientation)
    .then(() => {
      log.textContent = `Locked to ${oppositeOrientation}\n`;
    })
    .catch((error) => {
      log.textContent += `${error}\n`;
    });
});

// Unlock button: Unlock the screen orientation (if locked)
const unlockBtn = document.querySelector("#unlock_button");
unlockBtn.addEventListener("click", () => {
  log.textContent += "Unlock pressed \n";
  screen.orientation.unlock();
});

// Full screen button: Set the example to fullscreen.
const fullscreenBtn = document.querySelector("#fullscreen_button");
fullscreenBtn.addEventListener("click", () => {
  log.textContent += "Fullscreen pressed \n";
  const container = document.querySelector("#example_container");
  container.requestFullscreen().catch((error) => {
    log.textContent += `${error}\n`;
  });
});
```

Để kiểm tra ví dụ, trước tiên nhấn nút Fullscreen.
Khi ví dụ ở chế độ toàn màn hình, nhấn nút Lock để chuyển đổi hướng, và Unlock để trở về hướng tự nhiên.

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
