---
title: Pointer Lock API
slug: Web/API/Pointer_Lock_API
page-type: web-api-overview
browser-compat:
  - api.Document.exitPointerLock
  - api.Element.requestPointerLock
spec-urls: https://w3c.github.io/pointerlock/
---

{{DefaultAPISidebar("Pointer Lock API")}}

**Pointer Lock API** (trước đây được gọi là _Mouse Lock API_) cung cấp các phương pháp nhập liệu dựa trên chuyển động của chuột theo thời gian (tức là các delta), không chỉ vị trí tuyệt đối của con trỏ chuột trong viewport. Nó cung cấp cho bạn quyền truy cập vào chuyển động chuột thô, khóa mục tiêu của các sự kiện chuột vào một phần tử duy nhất, loại bỏ giới hạn về khoảng cách chuyển động chuột có thể đi theo một hướng và xóa con trỏ khỏi tầm nhìn. Nó lý tưởng cho các trò chơi 3D góc nhìn người thứ nhất, chẳng hạn.

Hơn thế nữa, API hữu ích cho bất kỳ ứng dụng nào yêu cầu đầu vào chuột đáng kể để điều khiển chuyển động, xoay đối tượng và thay đổi các mục, ví dụ cho phép người dùng kiểm soát góc nhìn bằng cách di chuyển chuột mà không cần nhấp chuột. Các nút khi đó được giải phóng cho các hành động khác. Các ví dụ khác bao gồm ứng dụng để xem bản đồ hoặc hình ảnh vệ tinh.

Pointer lock cho phép bạn truy cập các sự kiện chuột ngay cả khi con trỏ vượt ra ngoài ranh giới của trình duyệt hoặc màn hình. Ví dụ, người dùng của bạn có thể tiếp tục xoay hoặc thao tác mô hình 3D bằng cách di chuyển chuột vô hạn mà không lo lắng về việc rời khỏi khu vực trò chơi và vô tình nhấp vào ứng dụng khác sẽ lấy mất tiêu điểm chuột khỏi trò chơi.

## Các khái niệm cơ bản

Pointer lock có liên quan đến [pointer capture](/en-US/docs/Web/API/Pointer_events#pointer_capture). Pointer capture cung cấp việc tiếp tục gửi sự kiện đến phần tử mục tiêu trong khi chuột đang được kéo, nhưng nó dừng lại khi nút chuột được nhả ra. Pointer lock khác với pointer capture theo các cách sau:

- Nó liên tục: Pointer lock không nhả chuột cho đến khi một lệnh gọi API rõ ràng được thực hiện hoặc người dùng sử dụng một cử chỉ nhả cụ thể.
- Nó không bị giới hạn bởi ranh giới trình duyệt hoặc màn hình.
- Nó tiếp tục gửi sự kiện bất kể trạng thái nút chuột.
- Nó ẩn con trỏ.

## Tổng quan về phương thức/thuộc tính

Phần này cung cấp mô tả ngắn gọn về từng thuộc tính và phương thức liên quan đến đặc tả pointer lock.

### requestPointerLock()

Pointer lock API, tương tự như [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API), mở rộng các phần tử DOM bằng cách thêm phương thức mới, {{domxref("Element.requestPointerLock","requestPointerLock()")}}. Ví dụ sau yêu cầu pointer lock trên phần tử {{htmlelement("canvas")}}:

```js
canvas.addEventListener("click", async () => {
  await canvas.requestPointerLock();
});
```

> [!NOTE]
> Nếu người dùng đã thoát khỏi pointer lock thông qua cử chỉ mở khóa mặc định, hoặc pointer lock chưa được nhập trước đó cho tài liệu này, một sự kiện được tạo ra do cử chỉ tương tác phải được tài liệu nhận trước khi [`requestPointerLock`](https://w3c.github.io/pointerlock/#dom-element-requestpointerlock) sẽ thành công.

Các hệ điều hành bật tăng tốc chuột theo mặc định. Để tắt tăng tốc chuột cấp hệ điều hành và truy cập dữ liệu chuột thô, bạn có thể đặt `unadjustedMovement` thành `true`:

```js
canvas.addEventListener("click", async () => {
  await canvas.requestPointerLock({
    unadjustedMovement: true,
  });
});
```

### pointerLockElement và exitPointerLock()

Pointer lock API cũng mở rộng giao diện {{domxref("Document")}}, thêm thuộc tính mới và phương thức mới:

- {{domxref("Document.pointerLockElement","pointerLockElement")}} được sử dụng để truy cập phần tử hiện đang bị khóa (nếu có).
- {{domxref("Document.exitPointerLock","exitPointerLock()")}} được sử dụng để thoát khỏi pointer lock.

Đây là ví dụ sử dụng `pointerLockElement`:

```js
if (document.pointerLockElement === canvas) {
  console.log("The pointer lock status is now locked");
} else {
  console.log("The pointer lock status is now unlocked");
}
```

Phương thức {{domxref("Document.exitPointerLock()")}} được sử dụng để thoát khỏi pointer lock và hoạt động bất đồng bộ:

```js
document.exitPointerLock();
```

## Sự kiện pointerlockchange

Khi trạng thái Pointer lock thay đổi, sự kiện {{domxref("Document/pointerlockchange_event", "pointerlockchange")}} được gửi đến `document`.

```js
document.addEventListener("pointerlockchange", lockChangeAlert);

function lockChangeAlert() {
  if (document.pointerLockElement === canvas) {
    console.log("The pointer lock status is now locked");
  } else {
    console.log("The pointer lock status is now unlocked");
  }
}
```

## Sự kiện pointerlockerror

Khi có lỗi xảy ra do gọi {{domxref("Element.requestPointerLock","requestPointerLock()")}} hoặc {{domxref("Document.exitPointerLock","exitPointerLock()")}}, sự kiện {{domxref("Document/pointerlockerror_event", "pointerlockerror")}} được gửi đến `document`.

```js
document.addEventListener("pointerlockerror", lockError);

function lockError(e) {
  alert("Pointer lock failed");
}
```

## Mở rộng cho sự kiện chuột

Pointer lock API mở rộng giao diện {{domxref("MouseEvent")}} thông thường với các thuộc tính chuyển động. Hai thuộc tính mới cho sự kiện chuột, {{domxref("MouseEvent.movementX","movementX")}} và {{domxref("MouseEvent.movementY","movementY")}}, cung cấp sự thay đổi trong vị trí chuột.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MouseEvent")}}
- {{domxref("Element.requestPointerLock()")}}
