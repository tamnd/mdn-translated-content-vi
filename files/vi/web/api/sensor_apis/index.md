---
title: Sensor APIs
slug: Web/API/Sensor_APIs
page-type: web-api-overview
browser-compat:
  - api.Sensor
  - api.Accelerometer
  - api.OrientationSensor
  - api.Gyroscope
  - api.Magnetometer
  - api.AmbientLightSensor
spec-urls:
  - https://w3c.github.io/sensors/
  - https://w3c.github.io/accelerometer/
  - https://w3c.github.io/orientation-sensor/
  - https://w3c.github.io/ambient-light/
  - https://w3c.github.io/gyroscope/
  - https://w3c.github.io/magnetometer/
---

{{securecontext_header}}{{DefaultAPISidebar("Sensor API")}}

**Sensor APIs** là một tập hợp các giao diện được xây dựng theo một thiết kế chung, giúp hiển thị các cảm biến của thiết bị cho nền tảng web theo một cách nhất quán.

## Khái niệm và cách dùng

Mặc dù đặc tả Generic Sensor API định nghĩa một giao diện {{domxref('Sensor')}}, với tư cách là nhà phát triển web bạn sẽ không bao giờ dùng nó. Thay vào đó, bạn sẽ dùng một trong các lớp con của nó để lấy những loại dữ liệu cảm biến cụ thể. Ví dụ, giao diện {{domxref('Accelerometer')}} trả về gia tốc của thiết bị theo cả ba trục tại thời điểm dữ liệu được đọc.

Cảm biến có thể có hoặc không tương ứng chính xác với một cảm biến phần cứng thực tế. Ví dụ, giao diện {{domxref('Gyroscope')}} tương ứng trực tiếp với một giao diện phần cứng của thiết bị. Ngược lại, giao diện {{domxref('AbsoluteOrientationSensor')}} cung cấp thông tin được tổng hợp theo thuật toán từ hai hoặc nhiều cảm biến của thiết bị. Những loại cảm biến này lần lượt được gọi là _mức thấp_ và _mức cao_. Loại cảm biến sau cũng được gọi là cảm biến hợp nhất (còn gọi là cảm biến ảo hoặc cảm biến tổng hợp).

### Phát hiện tính năng

Các giao diện cảm biến chỉ là lớp proxy cho các cảm biến phần cứng bên dưới. Vì vậy, phát hiện tính năng đối với cảm biến phức tạp hơn so với các API khác. Sự hiện diện của một API cảm biến không cho bạn biết liệu API đó có được kết nối với một cảm biến phần cứng thật hay không, cảm biến đó có hoạt động không, nó còn được kết nối hay không, hoặc thậm chí người dùng đã cấp quyền truy cập hay chưa. Việc cung cấp tất cả thông tin này một cách nhất quán sẽ tốn kém về hiệu năng và thời lượng pin.

Vì vậy, việc phát hiện tính năng cho Sensor APIs phải bao gồm cả việc phát hiện chính các API và [các chiến lược lập trình phòng vệ (xem bên dưới)](#defensive_programming).

Các ví dụ dưới đây cho thấy ba cách phát hiện Sensor APIs. Ngoài ra, bạn có thể đặt việc khởi tạo đối tượng bên trong một khối {{jsxref('statements/try...catch', 'try...catch')}}. Lưu ý rằng việc phát hiện thông qua giao diện {{domxref('Navigator')}} không nằm trong các tùy chọn khả dụng.

```js
if (typeof Gyroscope === "function") {
  // run in circles…
}

if ("ProximitySensor" in window) {
  // watch out!
}

if (window.AmbientLightSensor) {
  // go dark…
}
```

### Lập trình phòng vệ

Như đã nêu ở Phát hiện tính năng, việc chỉ kiểm tra một API cảm biến cụ thể là chưa đủ để phát hiện tính năng. Cần phải xác nhận cả sự tồn tại của cảm biến thực tế. Đây là lúc cần đến lập trình phòng vệ. Lập trình phòng vệ đòi hỏi ba chiến lược.

- Kiểm tra các lỗi được ném ra khi khởi tạo một đối tượng cảm biến.
- Lắng nghe các lỗi được ném ra trong quá trình sử dụng.
- Xử lý lỗi một cách linh hoạt để trải nghiệm người dùng được cải thiện thay vì bị suy giảm.

Ví dụ mã dưới đây minh họa những nguyên tắc này. Khối {{jsxref('statements/try...catch', 'try...catch')}} bắt các lỗi được ném ra trong lúc khởi tạo cảm biến. Nó lắng nghe các sự kiện {{domxref('Sensor.error_event', 'error')}} để bắt các lỗi được ném ra trong quá trình sử dụng. Chỉ khi [quyền](/en-US/docs/Web/API/Permissions_API) cần được yêu cầu và khi loại cảm biến không được thiết bị hỗ trợ, người dùng mới thấy bất kỳ thông báo nào.

Ngoài ra, tính năng này có thể bị chặn bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

```js
let accelerometer = null;
try {
  accelerometer = new Accelerometer({ referenceFrame: "device" });
  accelerometer.addEventListener("error", (event) => {
    // Handle runtime errors.
    if (event.error.name === "NotAllowedError") {
      // Branch to code for requesting permission.
    } else if (event.error.name === "NotReadableError") {
      console.log("Cannot connect to the sensor.");
    }
  });
  accelerometer.addEventListener("reading", () => reloadOnShake(accelerometer));
  accelerometer.start();
} catch (error) {
  // Handle construction errors.
  if (error.name === "SecurityError") {
    // See the note above about permissions policy.
    console.log("Sensor construction was blocked by a permissions policy.");
  } else if (error.name === "ReferenceError") {
    console.log("Sensor is not supported by the User Agent.");
  } else {
    throw error;
  }
}
```

### Quyền và Permissions Policy

Dữ liệu đọc của cảm biến có thể không được lấy trừ khi người dùng cấp quyền cho một loại cảm biến cụ thể bằng [Permissions API](/en-US/docs/Web/API/Permissions_API) và/hoặc nếu quyền truy cập không bị chặn bởi {{httpheader('Permissions-Policy')}} trên máy chủ.

Ví dụ dưới đây cho thấy cách yêu cầu quyền của người dùng trước khi cố gắng dùng cảm biến.

```js
navigator.permissions.query({ name: "accelerometer" }).then((result) => {
  if (result.state === "denied") {
    console.log("Permission to use accelerometer sensor is denied.");
    return;
  }
  // Use the sensor.
});
```

Một cách tiếp cận khác là thử dùng cảm biến và lắng nghe `SecurityError`.

```js
const sensor = new AbsoluteOrientationSensor();
sensor.start();
sensor.addEventListener("error", (error) => {
  if (event.error.name === "SecurityError")
    console.log("No permissions to use AbsoluteOrientationSensor.");
});
```

Bảng sau mô tả, với mỗi loại cảm biến, tên cần dùng cho Permissions API, thuộc tính `allow` của phần tử {{HTMLElement('iframe')}} và chỉ thị {{httpheader('Permissions-Policy')}}.

| Sensor                      | Permission Policy Name                                 |
| --------------------------- | ------------------------------------------------------ |
| `AbsoluteOrientationSensor` | `'accelerometer'`, `'gyroscope'`, and `'magnetometer'` |
| `Accelerometer`             | `'accelerometer'`                                      |
| `AmbientLightSensor`        | `'ambient-light-sensor'`                               |
| `GravitySensor`             | `'accelerometer'`                                      |
| `Gyroscope`                 | `'gyroscope'`                                          |
| `LinearAccelerationSensor`  | `'accelerometer'`                                      |
| `Magnetometer`              | `'magnetometer'`                                       |
| `RelativeOrientationSensor` | `'accelerometer'`, and `'gyroscope'`                   |

### Dữ liệu đọc

Dữ liệu đọc của cảm biến được nhận thông qua bộ gọi lại sự kiện {{domxref('Sensor.reading_event', 'reading')}}, sự kiện này được kế thừa bởi tất cả các loại cảm biến. Tần suất đọc do bạn quyết định, thông qua một tùy chọn được truyền cho hàm khởi tạo của cảm biến. Tùy chọn này là một số xác định số lần đọc mỗi giây. Có thể dùng số nguyên hoặc số thập phân, trong đó số thập phân dùng cho tần suất nhỏ hơn một giây. Tần suất đọc thực tế phụ thuộc vào phần cứng của thiết bị và vì vậy có thể thấp hơn mức yêu cầu.

Ví dụ sau minh họa điều này bằng cảm biến {{domxref('Magnetometer')}}.

```js
let magSensor = new Magnetometer({ frequency: 60 });

magSensor.addEventListener("reading", (e) => {
  console.log(`Magnetic field along the X-axis ${magSensor.x}`);
  console.log(`Magnetic field along the Y-axis ${magSensor.y}`);
  console.log(`Magnetic field along the Z-axis ${magSensor.z}`);
});
magSensor.addEventListener("error", (event) => {
  console.log(event.error.name, event.error.message);
});
magSensor.start();
```

## Giao diện

- {{domxref('AbsoluteOrientationSensor')}}
  - : Mô tả hướng vật lý của thiết bị so với hệ tọa độ tham chiếu của Trái Đất.
- {{domxref('Accelerometer')}}
  - : Cung cấp gia tốc tác dụng lên thiết bị theo cả ba trục.
- {{domxref('AmbientLightSensor')}}
  - : Trả về mức sáng hiện tại, hay độ rọi, của ánh sáng môi trường xung quanh thiết bị lưu trữ.
- {{domxref('GravitySensor')}}
  - : Cung cấp lực hấp dẫn tác dụng lên thiết bị theo cả ba trục.
- {{domxref('Gyroscope')}}
  - : Cung cấp vận tốc góc của thiết bị theo cả ba trục.
- {{domxref('LinearAccelerationSensor')}}
  - : Cung cấp gia tốc tác dụng lên thiết bị theo cả ba trục, nhưng không bao gồm thành phần do trọng lực.
- {{domxref('Magnetometer')}}
  - : Cung cấp thông tin về từ trường được cảm biến từ kế chính của thiết bị phát hiện.
- {{domxref('OrientationSensor')}}
  - : Lớp cơ sở cho {{domxref('AbsoluteOrientationSensor')}}. Không thể dùng giao diện này trực tiếp; thay vào đó, nó cung cấp các thuộc tính và phương thức được truy cập bởi các giao diện kế thừa từ nó.
- {{domxref('RelativeOrientationSensor')}}
  - : Mô tả hướng vật lý của thiết bị mà không xét đến hệ tọa độ tham chiếu của Trái Đất.
- {{domxref('Sensor')}}
  - : Lớp cơ sở cho tất cả các giao diện cảm biến khác. Không thể dùng giao diện này trực tiếp. Thay vào đó, nó cung cấp các thuộc tính, bộ xử lý sự kiện và phương thức được truy cập bởi các giao diện kế thừa từ nó.
- {{domxref('SensorErrorEvent')}}
  - : Cung cấp thông tin về các lỗi do {{domxref('Sensor')}} hoặc giao diện liên quan ném ra.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
