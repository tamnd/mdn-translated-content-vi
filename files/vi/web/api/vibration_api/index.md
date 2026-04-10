---
title: Vibration API
slug: Web/API/Vibration_API
page-type: web-api-overview
browser-compat: api.Navigator.vibrate
spec-urls: https://w3c.github.io/vibration/
---

{{DefaultAPISidebar("Vibration API")}}

Hầu hết các thiết bị di động hiện đại đều bao gồm phần cứng rung, cho phép mã phần mềm cung cấp phản hồi vật lý cho người dùng bằng cách làm cho thiết bị rung. **Vibration API** cung cấp cho ứng dụng web khả năng truy cập phần cứng này, nếu có, và không làm gì nếu thiết bị không hỗ trợ.

## Khái niệm và cách sử dụng

Rung được mô tả dưới dạng một chuỗi các xung bật-tắt, có thể có độ dài khác nhau. Chuỗi có thể bao gồm một số nguyên duy nhất, mô tả số mili giây để rung, hoặc một mảng các số nguyên mô tả một chuỗi rung và tạm dừng. Việc điều khiển rung được thực hiện bằng một phương thức duy nhất: {{DOMxRef("Navigator.vibrate()")}}.

### Rung một lần

Bạn có thể kích hoạt phần cứng rung một lần bằng cách chỉ định một giá trị duy nhất hoặc một mảng chỉ gồm một giá trị:

```js
navigator.vibrate(200);
navigator.vibrate([200]);
```

Cả hai ví dụ trên đều làm cho thiết bị rung trong 200 ms.

### Chuỗi rung

Một mảng các giá trị mô tả các khoảng thời gian xen kẽ trong đó thiết bị đang rung và không rung. Mỗi giá trị trong mảng được chuyển đổi thành một số nguyên, sau đó được hiểu luân phiên là số mili giây thiết bị nên rung và số mili giây thiết bị không nên rung. Ví dụ:

```js
navigator.vibrate([200, 100, 200]);
```

Điều này làm cho thiết bị rung trong 200 ms, sau đó tạm dừng trong 100 ms trước khi rung thiết bị thêm một lần nữa trong 200 ms.

Bạn có thể chỉ định bao nhiêu cặp rung/tạm dừng tùy thích và bạn có thể cung cấp số lượng mục chẵn hoặc lẻ; đáng chú ý là bạn không cần cung cấp một khoảng tạm dừng làm mục cuối cùng vì việc rung sẽ tự động dừng khi kết thúc mỗi khoảng rung.

### Hủy các rung đang tồn tại

Gọi {{DOMxRef("Navigator.vibrate()")}} với giá trị `0`, một mảng rỗng, hoặc một mảng chứa toàn bộ số không sẽ hủy bỏ bất kỳ chuỗi rung nào đang diễn ra.

### Rung liên tục

Một số hành động `setInterval` và `clearInterval` cơ bản sẽ cho phép bạn tạo rung liên tục:

```js
let vibrateInterval;

// Bắt đầu rung ở mức truyền vào
function startVibrate(duration) {
  navigator.vibrate(duration);
}

// Dừng rung
function stopVibrate() {
  // Xóa interval và dừng rung liên tục
  if (vibrateInterval) clearInterval(vibrateInterval);
  navigator.vibrate(0);
}

// Bắt đầu rung liên tục ở thời lượng và khoảng thời gian nhất định
// Giả sử giá trị truyền vào là một số
function startPersistentVibrate(duration, interval) {
  vibrateInterval = setInterval(() => {
    startVibrate(duration);
  }, interval);
}
```

Tất nhiên, đoạn mã trên không tính đến phương thức mảng của việc rung; việc rung liên tục dựa trên mảng sẽ yêu cầu tính tổng các mục trong mảng và tạo một khoảng thời gian dựa trên số đó (với một độ trễ bổ sung, có thể).

## Các giao diện

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.vibrate()")}}
  - : Gây ra rung trên các thiết bị có hỗ trợ. Không làm gì nếu không hỗ trợ rung.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Navigator.vibrate()")}}
