---
title: "DOMPointReadOnly: fromPoint() static method"
short-title: fromPoint()
slug: Web/API/DOMPointReadOnly/fromPoint_static
page-type: web-api-static-method
browser-compat: api.DOMPointReadOnly.fromPoint_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **{{domxref("DOMPointReadOnly")}}** `fromPoint()` tạo và trả về một đối tượng `DOMPointReadOnly` mới từ một điểm nguồn.

Bạn cũng có thể tạo một đối tượng `DOMPointReadOnly` mới bằng cách sử dụng hàm khởi tạo {{domxref("DOMPointReadOnly.DOMPointReadOnly", "DOMPointReadOnly()")}}.

## Cú pháp

```js-nolint
DOMPointReadOnly.fromPoint(sourcePoint)
```

### Tham số

- `sourcePoint`
  - : Một đối tượng {{domxref("DOMPoint")}} hoặc {{domxref("DOMPointReadOnly")}}, hoặc một đối tượng chứa các thuộc tính sau, từ đó lấy các giá trị cho thuộc tính của điểm mới:
    - `x`
      - : Một giá trị số thực không bị giới hạn chỉ định tọa độ `x` của điểm trong không gian. Đây thường là tọa độ ngang, với các giá trị dương là bên phải và giá trị âm là bên trái. Giá trị mặc định là `0`.
    - `y`
      - : Một số thực không bị giới hạn cung cấp tọa độ `y` của điểm. Đây là tọa độ dọc, với các giá trị dương hướng xuống và giá trị âm hướng lên phía trên màn hình. Giá trị mặc định là `0`.
    - `z`
      - : Một giá trị số thực không bị giới hạn cung cấp tọa độ `z` của điểm, là tọa độ độ sâu; các giá trị dương gần người dùng hơn và các giá trị âm lùi vào màn hình. Giá trị mặc định là `0`.
    - `w`
      - : Giá trị phối cảnh `w` của điểm, được cung cấp dưới dạng số thực không bị giới hạn. Giá trị mặc định là `1`.

### Giá trị trả về

Một đối tượng {{domxref("DOMPointReadOnly")}} mới (giống hệt điểm nguồn).

## Ví dụ

### Tạo một điểm 2D

Ví dụ này tạo một điểm 2D, chỉ định một đối tượng nội tuyến bao gồm các giá trị cho {{domxref("DOMPointReadOnly.x", "x")}} và {{domxref("DOMPointReadOnly.y", "y")}}. Các thuộc tính `z` và `w` được phép giữ giá trị mặc định (`0` và `1` tương ứng).

```js
const point2D = DOMPointReadOnly.fromPoint({ x: 25, y: 25 });
```

### Tạo một điểm 3D sử dụng một điểm hiện có

Ví dụ này tạo một điểm `origPoint` kiểu {{domxref("DOMPoint")}}, sử dụng {{domxref("DOMPoint.DOMPoint", "DOMPoint()")}}. Điểm đó sau đó được sử dụng làm đầu vào cho `fromPoint()` để tạo điểm mới `newPoint`.

```js
const origPoint = new DOMPoint(25, 25, 100, 0.5);

const newPoint = DOMPointReadOnly.fromPoint(origPoint);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
