---
title: Dùng Element Capture và Region Capture APIs
slug: Web/API/Screen_Capture_API/Element_Region_Capture
page-type: guide
---

{{DefaultAPISidebar("Screen Capture API")}}

Hướng dẫn này cung cấp một walkthrough về cách dùng điển hình của Element Capture và Region Capture APIs, cho thấy cách dùng chúng và vấn đề mà chúng giải quyết.

## Bối cảnh

Theo mặc định, [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API) ghi lại toàn bộ màn hình, cửa sổ hoặc tab. Element Capture và Region Capture APIs lần lượt cho phép bạn giới hạn stream đã ghi chỉ còn một cây DOM được hiển thị cụ thể, hoặc phần màn hình được xác định bởi bounding box của một cây DOM cụ thể.

Điều này hữu ích khi bạn chỉ muốn chia sẻ một vùng giới hạn để giảm bớt băng thông không cần thiết hoặc giảm không gian màn hình cần để hiển thị bản ghi, hoặc vì lý do riêng tư (bạn có thể không muốn cho những người tham gia khác thấy thông báo tin nhắn của mình, hay các thiết lập nền cần để chạy bản demo bạn đang chia sẻ).

Ngoài ra, khi ghi đầu ra webcam của bạn, bạn có thể gặp hiệu ứng không mong muốn kiểu "infinite wormhole" hoặc "hall of mirrors". Element Capture và Region Capture APIs cũng có thể giúp tránh những vấn đề này.

## Khi nào dùng từng API

Element Capture API ghi lại chính phần tử đó (và các phần tử con của nó), trong khi Region Capture API ghi lại khu vực của tab trình duyệt được xác định bởi bounding box của phần tử đích. Element Capture luôn chỉ hiển thị phần tử được ghi, ngay cả khi nội dung DOM khác chồng lên nó, trong khi Region Capture có thể hiển thị nội dung chồng lên phía trên nội dung mà bạn định chia sẻ.

Cả hai đều có các trường hợp sử dụng hợp lệ:

- Nếu bạn cần giữ việc ghi chỉ trong một cây DOM duy nhất và loại trừ mọi thứ bên ngoài nó, Element Capture API là lựa chọn tốt hơn. Ví dụ, bạn không muốn nội dung riêng tư như thông báo tin nhắn hoặc giao diện speaker notes xuất hiện trong bản ghi.
- Tuy nhiên, nếu bạn thực sự muốn ghi một vùng của tab trình duyệt, bất kể những gì đang được hiển thị trong đó, Region Capture API sẽ phù hợp.

Ở phần tiếp theo chúng ta sẽ bắt đầu bằng một demo Screen Capture API cơ bản để minh họa các vấn đề mà Element Capture và Region Capture APIs được tạo ra để giải quyết.

## Demo Screen Capture API

Demo này dùng Screen Capture API để ghi một cửa sổ, màn hình hoặc tab, rồi phát stream qua một phần tử {{htmlelement("video")}} trên cùng trang. Bạn có thể xem bản chạy trực tiếp tại [Screen Capture API example](https://mdn.github.io/dom-examples/screen-capture-api/basic-screen-capture/) (cũng xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/screen-capture-api/basic-screen-capture)).

### HTML

HTML bắt đầu với một tiêu đề chính và văn bản giới thiệu, sau đó bao gồm hai phần tử {{htmlelement("button")}} để bắt đầu và dừng việc ghi:

```html
<h1>Screen Capture API example</h1>
<p>
  This example shows you the contents of the selected part of your display.
  Click the Start Capture button to begin.
</p>

<p>
  <button id="start">Start Capture</button>&nbsp;
  <button id="stop">Stop Capture</button>
</p>
```

Tiếp theo, chúng ta bao gồm container ứng dụng chính, chứa phần tử `<video>` để phát bản ghi, cùng một {{htmlelement("div")}} placeholder cho demo:

```html
<div id="main-app">
  <video autoplay></video>
  <div id="demo">
    <h2>Some kind of demo</h2>
    <p>
      This container is a placeholder for some kind of demo that you might want
      to share with other participants.
    </p>
  </div>
</div>
```

### CSS

CSS của demo này khá bình thường, nhưng vài quy tắc sau đáng để giải thích. Chúng tôi đã ẩn phần còn lại của CSS cho ngắn gọn.

```css hidden
* {
  box-sizing: border-box;
}

body {
  padding: 0 25px;
}

video,
#demo > p {
  border: 1px solid #cccccc;
  margin: 0;
}

#demo > h2 {
  margin-top: 0;
}

#demo > p {
  padding: 5px;
  height: 320px;
}
```

Chúng ta đặt giá trị {{cssxref("display")}} là `flex` cho `<div>` `main-app` để bố trí video và placeholder demo cạnh nhau thành hai cột, đồng thời đặt {{cssxref("gap")}} là `5%` giữa chúng. Chúng ta cũng đặt {{cssxref("min-width")}} là `980px` cho container, về cơ bản giới hạn ứng dụng demo ở bố cục desktop. Điều này là vì Element Capture và Region Capture chỉ được hỗ trợ trên trình duyệt desktop, và nội dung ngoài màn hình sẽ không được ghi.

```css
#main-app {
  display: flex;
  gap: 5%;
  min-width: 980px;
}
```

Chúng ta cũng đặt cho phần tử `<video>` và `<div>` `demo` giá trị {{cssxref("flex")}} là `1`, để chúng chiếm cùng một lượng không gian ngang.

```css
video,
#demo {
  flex: 1;
}
```

Cuối cùng, chúng ta đặt cho phần tử `<video>` giá trị {{cssxref("max-width")}} là `50%` và {{cssxref("aspect-ratio")}} cố định là `4/3`. Điều này giúp video giữ kích thước nhất quán và tránh việc bố cục bị xáo trộn quá nhiều khi screen capture bắt đầu được phát. Nếu không làm vậy, phần tử `<video>` sẽ rộng bằng chính vùng được ghi (cửa sổ hoặc màn hình), điều đó sẽ ảnh hưởng đến bố cục. Dù sao nó vẫn là một {{ glossary("replaced elements", "replaced element")}}, nên [kích thước nội tại](/en-US/docs/Glossary/Intrinsic_Size) của nó phụ thuộc vào nội dung.

```css
video {
  max-width: 50%;
  aspect-ratio: 4/3;
}
```

Việc thay đổi bố cục cũng có thể gây vấn đề khi dùng Region và Element Capture APIs, vì vậy đoạn mã này được đưa vào cả ba demo.

### JavaScript

JavaScript cho ví dụ này được chuyển thể từ ví dụ [Streaming screen capture](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture#streaming_screen_capture) trong hướng dẫn "Using the Screen Capture API". Chúng ta sẽ không lặp lại toàn bộ phần giải thích mã ở đây; chỉ giải thích phần mã ghi liên quan nhất.

Trong đối tượng tùy chọn truyền vào `getDisplayMedia()` khi gọi nó, chúng ta đặt [`preferCurrentTab: true`](/en-US/docs/Web/API/MediaDevices/getDisplayMedia#prefercurrenttab). Gợi ý này nói với trình duyệt rằng nó nên đưa tab hiện tại của người dùng lên vị trí nổi bật nhất trong hộp thoại hỏi họ muốn chia sẻ gì. Chrome, ví dụ, chỉ đưa ra tùy chọn này khi `preferCurrentTab: true` được đặt.

```js
const displayMediaOptions = {
  video: {
    displaySurface: "window",
  },
  preferCurrentTab: true,
};
```

Tùy chọn này rất hữu ích nếu bạn đang xây dựng một ứng dụng có sẵn tùy chọn "share screen" - bạn không muốn cho phép người dùng chia sẻ một tab hoặc cửa sổ khác.

Khi nút "Start Capture" được nhấn, hàm `startCapture()` chạy và gọi {{domxref("MediaDevices.getDisplayMedia()")}}. Điều này khiến trình duyệt nhắc người dùng chọn một vùng để chia sẻ (cửa sổ, tab, v.v.). Khi đã chọn xong, {{domxref("MediaStream")}} kết quả được gán vào thuộc tính {{domxref("HTMLMediaElement.srcObject")}} của phần tử `<video>` để phát nó:

```js
async function startCapture() {
  try {
    videoElem.srcObject =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
  } catch (err) {
    console.error(err);
  }
}
```

## Các vấn đề của Screen Capture API

Hãy chạy demo ở trên trong một [trình duyệt được hỗ trợ](/en-US/docs/Web/API/Screen_Capture_API#browser_compatibility), nhấn "Start Capture", rồi chọn chính tab đang chạy demo. Bạn sẽ thấy "hall of mirrors effect", như đã nói trước đó:

![A browser window containing a video capture of that same browser window, meaning that it shows infinite captures inside captures, getting smaller and smaller](hall-of-mirrors.png)

Rõ ràng đây không phải là điều lý tưởng, và sẽ gây vấn đề cho bất kỳ ứng dụng hội nghị nào có tùy chọn "share screen" tích hợp.

## Element Capture API

Element Capture API giới hạn vùng được ghi chỉ còn một cây DOM đã hiển thị cụ thể (một phần tử được chọn và các phần tử con của nó). Trong phần này chúng ta sẽ xem một demo thứ hai giống hệt demo ở trên, ngoại trừ việc nó dùng Element Capture trên nền Screen Capture cơ bản. Xem demo chạy trực tiếp tại [Element Capture API example](https://mdn.github.io/dom-examples/screen-capture-api/element-capture/) (cũng xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/screen-capture-api/element-capture)).

HTML giống hệt ví dụ trước, và CSS cũng _gần như_ giống hệt. Bây giờ chúng ta sẽ giải thích khác biệt trong JavaScript, rồi sau đó xem phần khác biệt của CSS ở phần [Restrictions on the Element Capture API](#restrictions_on_the_element_capture_api).

Để dùng Element Capture API, chúng ta cũng lấy tham chiếu tới một phần tử DOM mà sau này sẽ dùng làm **restriction target** - vùng màn hình hiển thị trong stream sẽ chỉ bị giới hạn ở phần tử đã hiển thị đó và các phần tử con của nó:

```js
const demoElem = document.querySelector("#demo");
```

Các khác biệt mã khác đều nằm trong hàm `startCapture()` đã được sửa đổi:

```js
async function startCapture() {
  try {
    const stream =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
    const [track] = stream.getVideoTracks();
    const restrictionTarget = await RestrictionTarget.fromElement(demoElem);
    await track.restrictTo(restrictionTarget);
    videoElem.srcObject = stream;
  } catch (err) {
    console.error(err);
  }
}
```

1. Ở đây, chúng ta bắt đầu bằng cách lấy media stream như trước, dùng `mediaDevices.getDisplayMedia()`.
2. Sau đó tách video track khỏi stream bằng {{domxref("MediaStream.getVideoTracks()")}}.
3. Chúng ta tạo đối tượng `restrictionTarget` cần thiết để áp đặt giới hạn lên video track bằng cách chạy {{domxref("RestrictionTarget.fromElement_static", "RestrictionTarget.fromElement()")}}, truyền vào tham chiếu phần tử DOM đã lấy ở trên.
4. Chúng ta áp dụng restriction target lên track bằng cách gọi {{domxref("BrowserCaptureMediaStreamTrack.restrictTo()")}}, truyền cho nó đối tượng `restrictionTarget`.
5. Khi mọi thứ ở trên xong, chúng ta đặt giá trị thuộc tính `srcObject` của phần tử `<video>` thành stream để bắt đầu phát nó.

Hãy thử chạy [Element Capture API example](https://mdn.github.io/dom-examples/screen-capture-api/element-capture/) trong một [trình duyệt được hỗ trợ](/en-US/docs/Web/API/RestrictionTarget#browser_compatibility) ngay bây giờ. Bạn sẽ thấy chỉ có placeholder của demo được bao gồm trong stream, qua đó sửa được vấn đề "hall of mirrors".

> [!NOTE]
> Bạn có thể dừng việc giới hạn bằng cách gọi lại `restrictTo()` trên cùng track, truyền đối số `null` cho nó:
>
> ```js
> await track.restrictTo(null);
> ```

### Hạn chế của Element Capture API

Để bảo đảm phần tử **đủ điều kiện để bị giới hạn**, tức là nó sẽ được ghi khi được chọn làm phần tử restriction target, nó phải tạo thành một [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) và được làm phẳng trong không gian 3D.

Để xử lý các hạn chế này, chúng ta đã đặt quy tắc CSS bổ sung sau nhắm vào phần tử container demo:

```css
#demo {
  /* Tạo thành stacking context */
  isolation: isolate;
  /* Làm phẳng */
  transform-style: flat;
  /* Màu nền rõ ràng để ngăn bản ghi bị trong suốt */
  background-color: white;
}
```

Thuộc tính {{cssxref("isolation")}} được đặt thành `isolate` để phần tử tạo stacking context, và thuộc tính {{cssxref("transform-style")}} được đặt thành `flat` để làm phẳng nó. Ngoài ra, do bản chất của isolation mà ta đặt, phần tử sẽ không còn kế thừa màu trắng mặc định của trang nữa. Vì vậy, chúng ta đặt {{cssxref("background-color")}} thành `white` để ngăn bản ghi trở nên trong suốt.

Để xem danh sách đầy đủ các hạn chế đối với phần tử có thể dùng làm restriction target, hãy xem trang tham chiếu [`RestrictionTarget.fromElement()`](/en-US/docs/Web/API/RestrictionTarget/fromElement_static#element).

## Region Capture API

Region Capture API có hiệu ứng rất giống Element Capture API, ngoại trừ việc thay vì giới hạn vùng được ghi vào một cây DOM đã hiển thị cụ thể, nó cắt stream thành vùng của tab trình duyệt hiện tại được xác định bởi bounding box của phần tử đích. Hãy xem một demo rồi sau đó tìm hiểu kỹ hơn sự khác nhau giữa hai API này.

Trong phần này chúng ta sẽ xem một demo thứ ba giống hệt các demo khác, ngoại trừ việc nó dùng Region Capture trên nền Screen Capture cơ bản. Xem demo chạy trực tiếp tại [Region Capture API example](https://mdn.github.io/dom-examples/screen-capture-api/region-capture/) (cũng xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/screen-capture-api/region-capture)).

HTML và CSS giống hệt các ví dụ trước. JavaScript gần như giống hệt JavaScript của Element Capture, chỉ có vài khác biệt đáng chú ý mà chúng ta sẽ giải thích ngay sau đây.

Để dùng Region Capture API, trước hết chúng ta lấy tham chiếu tới một phần tử DOM mà sau này sẽ dùng làm **crop target** - vùng hiển thị trong stream sẽ được cắt chỉ còn khu vực mà phần tử đó được hiển thị:

```js
const demoElem = document.querySelector("#demo");
```

Bây giờ hãy xem hàm `startCapture()` của demo Region Capture:

```js
async function startCapture() {
  try {
    const stream =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
    const [track] = stream.getVideoTracks();
    const cropTarget = await CropTarget.fromElement(demoElem);
    await track.cropTo(cropTarget);
    videoElem.srcObject = stream;
  } catch (err) {
    console.error(err);
  }
}
```

1. Như trước, chúng ta bắt đầu bằng cách lấy media stream bằng `mediaDevices.getDisplayMedia()`, rồi tách video track khỏi stream bằng {{domxref("MediaStream.getVideoTracks()")}}.
2. Chúng ta tạo đối tượng `cropTarget` cần thiết để áp dụng crop cho video track bằng cách chạy {{domxref("CropTarget.fromElement_static", "fromElement()")}}, truyền vào tham chiếu phần tử DOM đã lấy ở trên.
3. Chúng ta áp dụng crop target lên track bằng cách gọi {{domxref("BrowserCaptureMediaStreamTrack.cropTo()")}} trên nó, truyền vào đối tượng `cropTarget`.
4. Khi mọi thứ ở trên hoàn tất, chúng ta đặt giá trị thuộc tính `srcObject` của phần tử `<video>` thành stream để bắt đầu phát nó.

Hãy thử chạy [Region Capture API example](https://mdn.github.io/dom-examples/screen-capture-api/region-capture/) trong một [trình duyệt được hỗ trợ](/en-US/docs/Web/API/CropTarget#browser_compatibility) ngay bây giờ. Bạn sẽ thấy chỉ có placeholder của demo được bao gồm trong stream, điều này cũng sửa được vấn đề "hall of mirrors".

> [!NOTE]
> Bạn có thể dừng việc cắt bằng cách gọi lại `cropTo()` trên cùng track, truyền đối số `null` cho nó:
>
> ```js
> await track.cropTo(null);
> ```

### Hạn chế của Region Capture API

Region Capture không có mức hạn chế giống Element Capture - nó chỉ cắt stream theo một kích thước cụ thể, chứ không phát một cây DOM đã hiển thị cụ thể, nên nó không cần quy tắc này:

```css
#demo {
  /* Tạo thành stacking context */
  isolation: isolate;
  /* Làm phẳng */
  transform-style: flat;
  /* Màu nền rõ ràng để ngăn bản ghi bị trong suốt */
  background-color: white;
}
```

Tuy nhiên, vẫn có các hạn chế đối với những phần tử có thể dùng làm crop target. Để xem danh sách đầy đủ, hãy xem trang tham chiếu [`CropTarget.fromElement()`](/en-US/docs/Web/API/CropTarget/fromElement_static#element).

## Xem thêm

- [Capture a video stream from any element](https://developer.chrome.com/docs/web-platform/element-capture) trên developer.chrome.com (2025)
- [Better tab sharing with Region Capture](https://developer.chrome.com/docs/web-platform/region-capture) trên developer.chrome.com (2023)
