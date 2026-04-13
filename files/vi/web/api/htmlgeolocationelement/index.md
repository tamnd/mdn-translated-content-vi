---
title: HTMLGeolocationElement
slug: Web/API/HTMLGeolocationElement
page-type: web-api-interface
status:
  - experimental
browser-compat: api.HTMLGeolocationElement
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Giao diện **`HTMLGeolocationElement`** của [HTML DOM API](/en-US/docs/Web/API/HTML_DOM_API) đại diện cho phần tử {{htmlelement("geolocation")}} và cung cấp quyền truy cập vào các thuộc tính và sự kiện của nó.

Phần tử này dựa trên và kế thừa các thuộc tính và phương thức từ giao diện {{domxref("HTMLElement")}}.

> [!NOTE]
> Phần tử `<geolocation>` và giao diện `HTMLGeolocationElement` cho phép người dùng chia sẻ dữ liệu vị trí của họ với trang theo cách nhất quán và trực quan hơn so với [Geolocation API](/en-US/docs/Web/API/Geolocation_API) cũ hơn.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("HTMLGeolocationElement.HTMLGeolocationElement", "HTMLGeolocationElement()")}} {{experimental_inline}}
  - : Tạo một thực thể đối tượng `HTMLGeolocationElement` mới. Lưu ý rằng hàm khởi tạo này không được gọi trực tiếp, mà thông qua một phương thức DOM như {{domxref("Document.createElement()")}}.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLGeolocationElement.autolocate", "autolocate")}} {{experimental_inline}}
  - : Một giá trị boolean cho biết liệu trình duyệt có nên ngay lập tức yêu cầu dữ liệu vị trí khi phần tử `<geolocation>` được hiển thị không, với điều kiện quyền đã được cấp trước đó. Phản ánh giá trị của thuộc tính [`autolocate`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#autolocate) của `<geolocation>`.
- {{domxref("HTMLGeolocationElement.error", "error")}} {{readonlyinline}} {{experimental_inline}}
  - : Một đối tượng {{domxref("GeolocationPositionError")}} đại diện cho thông tin lỗi, trong trường hợp không lấy được dữ liệu.
- {{domxref("HTMLGeolocationElement.initialPermissionStatus", "initialPermissionStatus")}} {{readonlyinline}} {{experimental_inline}}
  - : Một giá trị liệt kê đại diện cho trạng thái quyền cho tính năng `geolocation` khi trang tải lần đầu.
- {{domxref("HTMLGeolocationElement.invalidReason", "invalidReason")}} {{readonlyinline}} {{experimental_inline}}
  - : Một giá trị liệt kê đại diện cho lý do tại sao phần tử `<geolocation>` không hợp lệ ([bị chặn](/en-US/docs/Web/HTML/Reference/Elements/geolocation#geolocation_blocking)), nếu đó là trường hợp.
- {{domxref("HTMLGeolocationElement.isValid", "isValid")}} {{readonlyinline}} {{experimental_inline}}
  - : Một giá trị boolean cho biết phần tử `<geolocation>` là hợp lệ hay không hợp lệ (bị chặn).
- {{domxref("HTMLGeolocationElement.permissionStatus", "permissionStatus")}} {{readonlyinline}} {{experimental_inline}}
  - : Một chuỗi đại diện cho trạng thái quyền hiện tại cho tính năng `geolocation`.
- {{domxref("HTMLGeolocationElement.position", "position")}} {{readonlyinline}} {{experimental_inline}}
  - : Một đối tượng {{domxref("GeolocationPosition")}} đại diện cho vị trí của người dùng, trong trường hợp lấy được dữ liệu vị trí thành công.
- {{domxref("HTMLGeolocationElement.watch", "watch")}} {{experimental_inline}}
  - : Một giá trị boolean cho biết trình duyệt có nên liên tục cập nhật dữ liệu vị trí của người dùng mỗi khi vị trí thiết bị thay đổi, hay chỉ lấy một lần. Phản ánh giá trị của thuộc tính [`watch`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#watch) của `<geolocation>`.

## Phương thức phiên bản

_Kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("HTMLElement")}}._

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLGeolocationElement.location_event", "location")}} {{experimental_inline}}
  - : Được kích hoạt mỗi khi trình duyệt nhận được dữ liệu vị trí, hoặc thông tin lỗi khi yêu cầu dữ liệu vị trí không thành công.
- {{domxref("HTMLGeolocationElement.promptaction_event", "promptaction")}} {{experimental_inline}}
  - : Được kích hoạt mỗi khi người dùng kích hoạt phần tử `<geolocation>` và chọn một tùy chọn từ hộp thoại kết quả, hoặc để cấp hoặc từ chối quyền `geolocation`.
- {{domxref("HTMLGeolocationElement.promptdismiss_event", "promptdismiss")}} {{experimental_inline}}
  - : Được kích hoạt mỗi khi người dùng kích hoạt phần tử `<geolocation>` và đóng hộp thoại kết quả, bằng cách nhấn nút "đóng" hoặc phím <kbd>Esc</kbd>.
- {{domxref("HTMLGeolocationElement.validationstatuschange_event", "validationstatuschange")}} {{experimental_inline}}
  - : Được kích hoạt mỗi khi giá trị {{domxref("HTMLGeolocationElement.isValid", "isValid")}} của phần tử `<geolocation>` thay đổi.

## Mô tả

Giao diện `HTMLGeolocationElement` đại diện cho phần tử {{htmlelement("geolocation")}}, tạo ra một điều khiển tương tác để cho phép người dùng chia sẻ dữ liệu vị trí của họ với trang.

Khi người dùng kích hoạt điều khiển, họ được trình bày với một hộp thoại yêu cầu quyền chia sẻ dữ liệu vị trí. Nếu họ cấp quyền, trình duyệt sẽ cố gắng lấy dữ liệu vị trí của người dùng bằng Geolocation API ở nền.

Theo mặc định, trình duyệt yêu cầu dữ liệu vị trí một lần, như thể phương thức {{domxref("Geolocation.getCurrentPosition()")}} được gọi. Tuy nhiên, nếu thuộc tính [`watch`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#watch) được đặt thành `true`, trình duyệt cập nhật dữ liệu mỗi khi vị trí thiết bị thay đổi, như thể {{domxref("Geolocation.watchPosition()")}} được gọi.

Khi yêu cầu dữ liệu trả về, sự kiện {{domxref("HTMLGeolocationElement.location_event", "location")}} được kích hoạt, cho phép bạn phản hồi thích hợp, ví dụ bằng cách lấy dữ liệu và vẽ vị trí trên bản đồ.

- Nếu dữ liệu vị trí được lấy thành công, nó có sẵn trong thuộc tính {{domxref("HTMLGeolocationElement.position")}}, chứa một đối tượng {{domxref("GeolocationPosition")}}.
- Nếu việc lấy dữ liệu không thành công, thông tin lỗi có sẵn trong thuộc tính {{domxref("HTMLGeolocationElement.error")}}, chứa một đối tượng {{domxref("GeolocationPositionError")}}.

Các sự kiện {{domxref("HTMLGeolocationElement.promptaction_event", "promptaction")}} và {{domxref("HTMLGeolocationElement.promptdismiss_event", "promptdismiss")}} cho phép bạn phản hồi các tương tác của người dùng với hộp thoại `<geolocation>`, ví dụ để yêu cầu họ đưa ra lựa chọn khác nếu họ từ chối quyền truy cập dữ liệu.

Khi một [bộ chặn](/en-US/docs/Web/HTML/Reference/Elements/geolocation#geolocation_blocking) đang hoạt động trên phần tử {{htmlelement("geolocation")}}, nó bị ngăn không hoạt động (không hợp lệ), tạm thời hoặc vĩnh viễn, tùy thuộc vào lý do. Bạn có thể kiểm tra xem nó có không hợp lệ không bằng cách truy vấn thuộc tính {{domxref("HTMLGeolocationElement.isValid")}}. Bạn cũng có thể trả về lý do tại sao nó không hợp lệ thông qua thuộc tính {{domxref("HTMLGeolocationElement.invalidReason")}} — xem trang đó để có danh sách đầy đủ các lý do có thể.

## Ví dụ

### Sử dụng cơ bản

Để có ví dụ tối giản sử dụng phần tử `<geolocation>` và đối tượng `HTMLGeolocationElement` liên quan để trả về dữ liệu vị trí, hãy xem [ví dụ cơ bản](https://mdn.github.io/dom-examples/geolocation-element/basic-example/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/basic-example)) và [ví dụ watch cơ bản](https://mdn.github.io/dom-examples/geolocation-element/basic-watch-example/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/basic-watch-example)).

Xem trang tham khảo [`<geolocation>`](/en-US/docs/Web/HTML/Reference/Elements/geolocation#basic_usage_example) để biết hướng dẫn chi tiết.

### Ví dụ bản đồ nhúng

Ví dụ này sử dụng phần tử `<geolocation>` để lấy vị trí hiện tại của bạn, được vẽ trên bản đồ được hiển thị bằng [Leaflet JS](https://leafletjs.com/). Ví dụ cũng sử dụng một `<button>` thông thường làm dự phòng để lấy dữ liệu vị trí trên các trình duyệt không hỗ trợ.

#### HTML

Chúng tôi bao gồm một phần tử `<geolocation>` với thuộc tính `autolocate` để trình duyệt sẽ cố gắng lấy dữ liệu vị trí tự động, với điều kiện quyền `geolocation` đã được cấp trước đó. Bên trong phần tử `<geolocation>`, chúng tôi lồng một dự phòng {{htmlelement("button")}}, sẽ được hiển thị trong các trình duyệt không hỗ trợ `<geolocation>` để cho phép yêu cầu dữ liệu vị trí.

```html
<geolocation autolocate>
  <button id="fallback">Use location</button>
</geolocation>
```

Tiếp theo, chúng tôi bao gồm một phần tử {{htmlelement("p")}} để in thông báo trạng thái và lỗi vào.

```html
<p id="status">Status:</p>
```

Cuối cùng, chúng tôi bao gồm một phần tử {{htmlelement("div")}} để hiển thị bản đồ vào.

```html
<div id="map"></div>
```

#### JavaScript

Trong tập lệnh của chúng tôi, trước tiên chúng tôi lấy tham chiếu đến phần tử `<p>` trạng thái:

```js
const statusElem = document.querySelector("#status");
```

Tiếp theo, chúng tôi phát hiện xem phần tử `<geolocation>` có được hỗ trợ không bằng cách kiểm tra `typeof HTMLGeolocationElement === "function"`:

```js
if (typeof HTMLGeolocationElement === "function") {
  // <geolocation> is supported
} else {
  // <geolocation> is not supported; use fallback button
}
```

Nếu `<geolocation>` được hỗ trợ, khối `if` được thực thi. Nó bắt đầu bằng cách lấy tham chiếu đến phần tử `<geolocation>`:

```js
const geo = document.querySelector("geolocation");
```

Tiếp theo, chúng tôi thêm một trình lắng nghe sự kiện {{domxref("HTMLGeolocationElement.location_event", "location")}} vào đối tượng `HTMLGeolocationElement` kết quả, để phát hiện khi yêu cầu dữ liệu vị trí được trả về. Nếu dữ liệu được trả về thành công, chúng tôi truy cập nó thông qua thuộc tính {{domxref("HTMLGeolocationElement.position")}} và lấy các giá trị vĩ độ và kinh độ. Chúng tôi ghi log chúng vào bảng điều khiển, sau đó vẽ chúng trên bản đồ bằng cách truyền chúng vào hàm `drawMap()` (mà chúng tôi sẽ định nghĩa sau) cùng với tham chiếu đến đối tượng `HTMLGeolocationElement`. Nếu yêu cầu dữ liệu thất bại, chúng tôi truy cập lỗi thông qua thuộc tính {{domxref("HTMLGeolocationElement.error")}} và ghi log thông báo lỗi vào bảng điều khiển.

```js
geo.addEventListener("location", () => {
  if (geo.position) {
    console.log(
      `${geo.position.coords.latitude},${geo.position.coords.longitude}`,
    );
    drawMap(geo.position.coords.latitude, geo.position.coords.longitude, geo);
  } else if (geo.error) {
    console.log(geo.error.message);
  }
});
```

Tiếp theo, chúng tôi thêm các trình lắng nghe sự kiện {{domxref("HTMLGeolocationElement.promptdismiss_event", "promptdismiss")}} và {{domxref("HTMLGeolocationElement.promptaction_event", "promptaction")}} vào đối tượng `HTMLGeolocationElement` kết quả. Những sự kiện này cho phép chúng tôi chạy các hàm để phản hồi việc người dùng đóng lời nhắc `<geolocation>`, hoặc chọn một tùy chọn từ lời nhắc, tương ứng.

```js
geo.addEventListener("promptdismiss", notifyUserRetrySelection);
geo.addEventListener("promptaction", notifyUserGrantPermission);
```

Cuối cùng cho khối `if`, chúng tôi định nghĩa các hàm `notifyUserRetrySelection()` và `notifyUserGrantPermission()` được tham chiếu trong hai trình lắng nghe sự kiện trước. Hàm trước in một thông báo vào đoạn trạng thái cho người dùng biết nhấn nút lại và cho phép vị trí. Hàm sau sử dụng thuộc tính {{domxref("HTMLGeolocationElement.permissionStatus")}} để kiểm tra xem trạng thái quyền có phải là `denied` hoặc `prompt` không và nếu vậy, chúng tôi yêu cầu họ nhấn nút lại và cho phép vị trí. Chúng tôi không cần hỏi điều này nếu họ đã cấp quyền.

```js
function notifyUserRetrySelection() {
  statusElem.textContent =
    'Please press the "Use location" button again and allow location for this site.';
}

function notifyUserGrantPermission() {
  if (geo.permissionStatus === "denied" || geo.permissionStatus === "prompt") {
    statusElem.textContent =
      'Please press the "Use location" button again and allow location for this site.';
  }
}
```

Nếu `<geolocation>` không được hỗ trợ, khối `else` được thực thi. Điều này bắt đầu bằng cách lấy tham chiếu đến phần tử `<button>` dự phòng:

```js
const fallback = document.querySelector("#fallback");
```

Tiếp theo, chúng tôi thêm trình xử lý sự kiện `click` vào đối tượng `HTMLButtonElement` kết quả. Bên trong, chúng tôi sử dụng lệnh gọi {{domxref("Geolocation.getCurrentPosition()")}} để mô phỏng các trường hợp thành công và thất bại trong đường dẫn mã `HTMLGeolocationElement`. Kết quả là như nhau, chúng tôi hoặc vẽ dữ liệu vị trí trên bản đồ bằng cách truyền nó vào hàm `drawMap()` (cùng với tham chiếu đến đối tượng `HTMLButtonElement`), hoặc in thông báo lỗi vào đoạn trạng thái.

```js
fallback.addEventListener("click", () => {
  navigator.geolocation.getCurrentPosition(
    (position) => {
      drawMap(position.coords.latitude, position.coords.longitude, fallback);
    },
    (error) => {
      statusElem.textContent += `${error.message}, `;
    },
  );
});
```

Bước cuối cùng là định nghĩa hàm `drawMap()`, nhận dữ liệu vĩ độ và kinh độ làm đối số, cùng với tham chiếu đến nút đã kích hoạt lệnh. Thân hàm sử dụng mã [Leaflet JS](https://leafletjs.com/) (xem [Hướng dẫn Bắt đầu Nhanh Leaflet](https://leafletjs.com/examples/quick-start/) để giải thích) để vẽ vị trí của người dùng trên bản đồ, in thông báo thành công vào đoạn trạng thái, và ẩn nút. Bước cuối cùng là đơn giản hóa để ngăn mã bị lỗi nếu người dùng nhấn nút lần nữa sau khi thành công.

```js
function drawMap(lat, long, btn) {
  const map = L.map("map").setView([lat, long], 13);
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution:
      '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
  }).addTo(map);
  const marker = L.marker([lat, long]).addTo(map);

  statusElem.textContent = "Map drawn successfully.";
  btn.style.display = "none";
}
```

#### Kết quả

Xem mã này [chạy trực tiếp](https://mdn.github.io/dom-examples/geolocation-element/embedded-map/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/embedded-map)). Hãy thử xem các bản demo trong trình duyệt được hỗ trợ và trình duyệt không được hỗ trợ nếu có thể, và lưu ý sự khác biệt trong luồng hộp thoại quyền khi bạn cho phép quyền sử dụng `geolocation`.

Cũng thử các điều sau:

- Sau khi bạn cho phép quyền `geolocation` và thấy bản đồ được hiển thị, thử thu hồi quyền đó bằng các điều khiển trình duyệt có sẵn và sau đó làm mới trang để đặt lại ví dụ.
- Bây giờ thử từ chối quyền sử dụng `geolocation` hoặc đóng hộp thoại quyền và lưu ý cách các trình lắng nghe sự kiện `promptdismiss` và `promptaction` mà chúng tôi đã thiết lập trước đó khiến một thông báo được in vào đoạn trạng thái để giúp người dùng sử dụng trang.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
- {{httpheader("Permissions-Policy/geolocation", "geolocation")}} [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Geolocation API](/en-US/docs/Web/API/Geolocation_API)
- [Permissions API](/en-US/docs/Web/API/Permissions_API)
- [Introducing the `<geolocation>` HTML element](https://developer.chrome.com/blog/geolocation-html-element) trên developer.chrome.com (2026)
