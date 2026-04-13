---
title: Sử dụng Geolocation API
slug: Web/API/Geolocation_API/Using_the_Geolocation_API
page-type: guide
---

{{DefaultAPISidebar("Geolocation API")}}

Geolocation API được dùng để lấy vị trí của người dùng, chẳng hạn để hiển thị vị trí đó bằng một API bản đồ. Bài viết này giải thích các kiến thức cơ bản về cách sử dụng nó.

## Đối tượng geolocation

[Geolocation API](/en-US/docs/Web/API/Geolocation) có sẵn thông qua đối tượng {{domxref("navigator.geolocation")}}.

Nếu đối tượng này tồn tại, các dịch vụ định vị sẽ khả dụng. Bạn có thể kiểm tra sự hiện diện của geolocation như sau:

```js
if ("geolocation" in navigator) {
  /* geolocation is available */
} else {
  /* geolocation IS NOT available */
}
```

### Lấy vị trí hiện tại

Để lấy vị trí hiện tại của người dùng, bạn có thể gọi phương thức {{domxref("Geolocation.getCurrentPosition","getCurrentPosition()")}}. Việc này khởi tạo một yêu cầu bất đồng bộ để phát hiện vị trí của người dùng, và truy vấn phần cứng định vị để lấy thông tin cập nhật nhất. Khi vị trí được xác định, hàm callback đã khai báo sẽ được thực thi. Bạn có thể tùy chọn cung cấp một hàm callback thứ hai để chạy nếu xảy ra lỗi. Tham số thứ ba, tùy chọn, là một đối tượng tùy chọn nơi bạn có thể đặt tuổi tối đa của vị trí trả về, thời gian chờ cho một yêu cầu, và việc bạn có muốn độ chính xác cao cho vị trí hay không.

> [!NOTE]
> Theo mặc định, {{domxref("Geolocation.getCurrentPosition","getCurrentPosition()")}} sẽ cố gắng phản hồi nhanh nhất có thể với kết quả có độ chính xác thấp. Điều này hữu ích nếu bạn cần câu trả lời nhanh bất kể độ chính xác. Ví dụ, các thiết bị có GPS có thể mất một phút hoặc lâu hơn để bắt được tín hiệu GPS, nên dữ liệu kém chính xác hơn (vị trí IP hoặc Wi-Fi) có thể được trả về cho `getCurrentPosition()`.

```js
navigator.geolocation.getCurrentPosition((position) => {
  doSomething(position.coords.latitude, position.coords.longitude);
});
```

Ví dụ trên sẽ khiến hàm `doSomething()` được thực thi khi vị trí đã được lấy.

### Theo dõi vị trí hiện tại

Nếu dữ liệu vị trí thay đổi (do thiết bị di chuyển hoặc do thông tin địa lý chính xác hơn được gửi đến), bạn có thể thiết lập một hàm callback sẽ được gọi với thông tin vị trí đã cập nhật đó. Việc này được thực hiện bằng hàm {{domxref("Geolocation.watchPosition","watchPosition()")}}, hàm này có cùng các tham số đầu vào như {{domxref("Geolocation.getCurrentPosition","getCurrentPosition()")}}. Hàm callback sẽ được gọi nhiều lần, cho phép trình duyệt hoặc cập nhật vị trí của bạn khi bạn di chuyển, hoặc cung cấp vị trí chính xác hơn khi các kỹ thuật khác nhau được dùng để định vị bạn. Hàm callback lỗi, vốn cũng là tùy chọn như với `getCurrentPosition()`, có thể được gọi nhiều lần.

> [!NOTE]
> Bạn có thể dùng {{domxref("Geolocation.watchPosition","watchPosition()")}} mà không cần gọi {{domxref("Geolocation.getCurrentPosition","getCurrentPosition()")}} trước.

```js
const watchID = navigator.geolocation.watchPosition((position) => {
  doSomething(position.coords.latitude, position.coords.longitude);
});
```

Phương thức {{domxref("Geolocation.watchPosition","watchPosition()")}} trả về một số ID có thể dùng để định danh duy nhất trình theo dõi vị trí đã đăng ký; bạn dùng giá trị này cùng với phương thức {{domxref("Geolocation.clearWatch","clearWatch()")}} để dừng theo dõi vị trí của người dùng.

```js
navigator.geolocation.clearWatch(watchID);
```

### Tinh chỉnh phản hồi

Cả {{domxref("Geolocation.getCurrentPosition","getCurrentPosition()")}} và {{domxref("Geolocation.watchPosition","watchPosition()")}} đều chấp nhận một callback thành công, một callback lỗi tùy chọn, và một đối tượng tùy chọn.

Đối tượng này cho phép bạn chỉ định có bật độ chính xác cao hay không, tuổi tối đa của giá trị vị trí trả về là bao nhiêu (đến trước tuổi này, vị trí sẽ được lưu đệm và dùng lại nếu cùng vị trí được yêu cầu lần nữa; sau đó trình duyệt sẽ yêu cầu dữ liệu vị trí mới), và giá trị timeout xác định trình duyệt nên cố gắng lấy dữ liệu vị trí trong bao lâu trước khi hết thời gian chờ.

Một lời gọi {{domxref("Geolocation.watchPosition","watchPosition()")}} có thể trông như sau:

```js
function success(position) {
  doSomething(position.coords.latitude, position.coords.longitude);
}

function error() {
  alert("Sorry, no position available.");
}

const options = {
  enableHighAccuracy: true,
  maximumAge: 30000,
  timeout: 27000,
};

const watchID = navigator.geolocation.watchPosition(success, error, options);
```

## Mô tả vị trí

Vị trí của người dùng được mô tả bằng một thể hiện đối tượng {{domxref("GeolocationPosition")}}, bản thân nó chứa một thể hiện đối tượng {{domxref("GeolocationCoordinates")}}.

Thể hiện `GeolocationPosition` chỉ chứa hai thứ, một thuộc tính `coords` chứa thể hiện `GeolocationCoordinates`, và một thuộc tính `timestamp` chứa dấu thời gian, được cung cấp dưới dạng {{Glossary("Unix time")}} tính bằng mili giây, tại thời điểm dữ liệu vị trí được lấy.

Thể hiện `GeolocationCoordinates` chứa một số thuộc tính, nhưng hai thuộc tính bạn thường dùng nhất là `latitude` và `longitude`, chính là những gì bạn cần để vẽ vị trí của mình trên bản đồ. Vì vậy, nhiều callback thành công của Geolocation trông khá đơn giản:

```js
function success(position) {
  const latitude = position.coords.latitude;
  const longitude = position.coords.longitude;

  // Do something with your latitude and longitude
}
```

Tuy nhiên, bạn có thể lấy nhiều thông tin khác từ một đối tượng `GeolocationCoordinates`, bao gồm độ cao, tốc độ, hướng thiết bị đang quay về, và thước đo độ chính xác của dữ liệu độ cao, kinh độ và vĩ độ.

## Xử lý lỗi

Hàm callback lỗi, nếu được cung cấp khi gọi `getCurrentPosition()` hoặc `watchPosition()`, sẽ nhận một thể hiện đối tượng [`GeolocationPositionError`](/en-US/docs/Web/API/GeolocationPositionError) làm tham số đầu tiên. Kiểu đối tượng này chứa hai thuộc tính, một `code` cho biết loại lỗi nào đã được trả về, và một `message` dễ đọc mô tả ý nghĩa của mã lỗi.

Bạn có thể dùng nó như sau:

```js
function errorCallback(error) {
  alert(`ERROR(${error.code}): ${error.message}`);
}
```

## Ví dụ

Trong ví dụ sau, Geolocation API được dùng để lấy vĩ độ và kinh độ của người dùng. Nếu thành công, liên kết có sẵn sẽ được điền bằng một URL `openstreetmap.org` để hiển thị vị trí của họ.

```css hidden
body {
  padding: 20px;
  background-color: #ffffc9;
}

button {
  margin: 0.5rem 0;
}
```

### HTML

```html
<button id="find-me">Show my location</button><br />
<p id="status"></p>
<a id="map-link" href="" target="_blank">Location unknown</a>
```

### JavaScript

```js
function geoFindMe() {
  const status = document.querySelector("#status");
  const mapLink = document.querySelector("#map-link");

  mapLink.href = "";
  mapLink.textContent = "";

  function success(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    status.textContent = "";
    mapLink.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
    mapLink.textContent = `Latitude: ${latitude} °, Longitude: ${longitude} °`;
  }

  function error() {
    status.textContent = "Unable to retrieve your location";
  }

  if (!navigator.geolocation) {
    status.textContent = "Geolocation is not supported by your browser";
  } else {
    status.textContent = "Locating…";
    navigator.geolocation.getCurrentPosition(success, error);
  }
}

document.querySelector("#find-me").addEventListener("click", geoFindMe);
```

### Kết quả

{{EmbedLiveSample('Examples', 350, 150, "", "", "", "geolocation")}}

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
