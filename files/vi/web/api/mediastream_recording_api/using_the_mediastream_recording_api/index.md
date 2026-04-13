---
title: Sử dụng MediaStream Recording API
slug: Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API
page-type: guide
browser-compat: api.MediaRecorder
---

{{DefaultAPISidebar("MediaStream Recording")}}

[MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API) giúp dễ dàng ghi các luồng âm thanh và/hoặc video. Khi sử dụng với {{domxref("MediaDevices.getUserMedia()","navigator.mediaDevices.getUserMedia()")}}, nó cung cấp cách dễ dàng để ghi từ các thiết bị đầu vào của người dùng và sử dụng ngay kết quả trong các ứng dụng web.

Cả âm thanh và video đều có thể được ghi, riêng biệt hoặc cùng nhau. Bài viết này nhằm cung cấp hướng dẫn cơ bản về cách sử dụng giao diện MediaRecorder, cung cấp API này.

## Ứng dụng mẫu: Web Dictaphone

![An image of the Web dictaphone sample app - a sine wave sound visualization, then record and stop buttons, then an audio jukebox of recorded tracks that can be played back.](web-dictaphone.png)

Để trình bày cách sử dụng cơ bản của MediaStream Recording API, chúng ta đã xây dựng một máy ghi âm dựa trên web. Nó cho phép bạn ghi các đoạn âm thanh và sau đó phát lại. Thậm chí còn cung cấp hình ảnh trực quan về âm thanh đầu vào của thiết bị, sử dụng Web Audio API. Chúng ta sẽ tập trung vào chức năng ghi và phát lại cho bài viết này.

Bạn có thể xem [bản demo này đang chạy trực tiếp](https://mdn.github.io/dom-examples/media/web-dictaphone/), hoặc [lấy mã nguồn](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone) trên GitHub.

## CSS goodies

HTML khá đơn giản trong ứng dụng này, vì vậy chúng ta sẽ không đi qua nó ở đây; có một vài bit CSS thú vị hơn đáng được đề cập, vì vậy chúng ta sẽ thảo luận về chúng bên dưới. Nếu bạn không quan tâm đến CSS và muốn đi thẳng vào JavaScript, hãy bỏ qua đến phần [Basic app setup](#basic_app_setup).

### Giữ giao diện bị hạn chế trong viewport, bất kể chiều cao thiết bị, với calc()

Hàm {{cssxref("calc", "calc()")}} là một trong những tính năng tiện ích nhỏ hữu ích xuất hiện trong CSS trông không đáng kể ban đầu, nhưng sớm khiến bạn nghĩ "Wow, tại sao chúng ta không có điều này trước đây? Tại sao CSS2 layout lại khó xử đến vậy?" Nó cho phép bạn thực hiện phép tính để xác định giá trị tính toán của đơn vị CSS, kết hợp các đơn vị khác nhau trong quá trình đó.

Ví dụ, trong Web Dictaphone chúng ta có ba khu vực UI chính, được xếp chồng theo chiều dọc. Chúng ta muốn đặt cho hai khu vực đầu tiên (header và controls) chiều cao cố định:

```css
header {
  height: 70px;
}

.main-controls {
  padding-bottom: 0.7rem;
  height: 170px;
}
```

Tuy nhiên, chúng ta muốn khu vực thứ ba (chứa các mẫu đã ghi bạn có thể phát lại) chiếm bất kỳ không gian nào còn lại, bất kể chiều cao thiết bị. Flexbox có thể là giải pháp ở đây, nhưng hơi quá mức cho một bố cục đơn giản như vậy. Thay vào đó, vấn đề được giải quyết bằng cách đặt chiều cao của container thứ ba bằng 100% chiều cao cha, trừ đi chiều cao và padding của hai khu vực còn lại:

```css
.sound-clips {
  box-shadow: inset 0 3px 4px rgb(0 0 0 / 70%);
  background-color: rgb(0 0 0 / 10%);
  height: calc(100% - 240px - 0.7rem);
  overflow: scroll;
}
```

### Checkbox hack để hiển thị/ẩn

Điều này đã được ghi chép khá đầy đủ rồi, nhưng chúng ta muốn đề cập đến checkbox hack, lạm dụng thực tế là bạn có thể click vào {{htmlelement("label")}} của checkbox để bật/tắt trạng thái đã chọn. Trong Web Dictaphone, điều này cung cấp năng lượng cho màn hình thông tin, được hiển thị/ẩn bằng cách nhấp vào biểu tượng dấu hỏi ở góc trên bên phải. Đầu tiên, chúng ta định kiểu `<label>` theo cách chúng ta muốn, đảm bảo rằng nó có z-index đủ để luôn ngồi phía trên các phần tử khác và do đó có thể focus/click được:

```css
label {
  font-family: "Noto Color Emoji", emoji;
  font-size: 3rem;
  position: absolute;
  top: 2px;
  right: 3px;
  z-index: 5;
  cursor: pointer;
}
```

Sau đó chúng ta ẩn checkbox thực sự, vì chúng ta không muốn nó làm lộn xộn UI:

```css
input[type="checkbox"] {
  position: absolute;
  top: -100px;
}
```

Tiếp theo, chúng ta định kiểu màn hình thông tin (được bọc trong phần tử {{htmlelement("aside")}}) theo cách chúng ta muốn, đặt vị trí cố định để nó không xuất hiện trong luồng bố cục và ảnh hưởng đến UI chính, biến đổi nó đến vị trí chúng ta muốn nó ngồi theo mặc định, và đặt cho nó hiệu ứng chuyển đổi để hiển thị/ẩn mượt mà:

```css
aside {
  position: fixed;
  top: 0;
  left: 0;
  text-shadow: 1px 1px 1px black;
  width: 100%;
  height: 100%;
  transform: translateX(100%);
  transition: 0.6s all;
  background-color: #999999;
  background-image: linear-gradient(
    to top right,
    transparent,
    rgb(0 0 0 / 50%)
  );
}
```

Cuối cùng, chúng ta viết quy tắc để nói rằng khi checkbox được chọn (khi chúng ta nhấp/focus vào label), phần tử `<aside>` kề bên sẽ có giá trị dịch ngang của nó thay đổi và chuyển đổi mượt mà vào tầm nhìn:

```css
input[type="checkbox"]:checked ~ aside {
  transform: translateX(0);
}
```

## Thiết lập ứng dụng cơ bản

Để lấy luồng phương tiện chúng ta muốn thu thập, chúng ta sử dụng `getUserMedia()`. Sau đó chúng ta sử dụng MediaStream Recording API để ghi luồng, và xuất mỗi đoạn đã ghi vào nguồn của phần tử {{htmlelement("audio")}} được tạo để có thể phát lại.

Chúng ta sẽ khai báo một số biến cho nút ghi và dừng, và {{htmlelement("article")}} sẽ chứa các trình phát âm thanh được tạo:

```js
const record = document.querySelector(".record");
const stop = document.querySelector(".stop");
const soundClips = document.querySelector(".sound-clips");
```

Cuối cùng cho phần này, chúng ta thiết lập cấu trúc `getUserMedia` cơ bản:

```js
if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
  console.log("getUserMedia supported.");
  navigator.mediaDevices
    .getUserMedia(
      // constraints - only audio needed for this app
      {
        audio: true,
      },
    )

    // Success callback
    .then((stream) => {})

    // Error callback
    .catch((err) => {
      console.error(`The following getUserMedia error occurred: ${err}`);
    });
} else {
  console.log("getUserMedia not supported on your browser!");
}
```

Toàn bộ được bọc trong một bài kiểm tra xem `getUserMedia` có được hỗ trợ trước khi chạy bất cứ điều gì khác hay không. Tiếp theo, chúng ta gọi `getUserMedia()` và bên trong nó định nghĩa:

- **Constraints**: Chỉ âm thanh được thu thập cho máy ghi âm của chúng ta.
- **Success callback**: Mã này chạy sau khi lệnh gọi `getUserMedia` hoàn thành thành công.
- **Error/failure callback**: Mã chạy nếu lệnh gọi `getUserMedia` thất bại vì bất kỳ lý do gì.

> [!NOTE]
> Tất cả mã bên dưới được đặt bên trong success callback của `getUserMedia`.

## Thu thập luồng phương tiện

Sau khi `getUserMedia` tạo luồng phương tiện thành công, bạn tạo phiên bản Media Recorder mới với hàm khởi tạo `MediaRecorder()` và truyền trực tiếp luồng vào đó. Đây là điểm vào để sử dụng MediaStream Recording API, luồng giờ đã sẵn sàng để được thu thập vào {{domxref("Blob")}}, theo định dạng mã hóa mặc định của trình duyệt.

```js
const mediaRecorder = new MediaRecorder(stream);
```

Có một loạt các phương thức có sẵn trong giao diện {{domxref("MediaRecorder")}} cho phép bạn kiểm soát việc ghi luồng phương tiện; trong Web Dictaphone chúng ta chỉ sử dụng hai phương thức, và lắng nghe một số sự kiện. Đầu tiên, {{domxref("MediaRecorder.start()")}} được sử dụng để bắt đầu ghi luồng sau khi nút ghi được nhấn:

```js
record.onclick = () => {
  mediaRecorder.start();
  console.log(mediaRecorder.state);
  console.log("recorder started");
  record.style.background = "red";
  record.style.color = "black";
};
```

Khi `MediaRecorder` đang ghi, thuộc tính {{domxref("MediaRecorder.state")}} sẽ trả về giá trị "recording".

Khi ghi tiến triển, chúng ta cần thu thập dữ liệu âm thanh. Chúng ta đăng ký trình xử lý sự kiện để làm điều này bằng cách sử dụng {{domxref("mediaRecorder.dataavailable_event", "ondataavailable")}}:

```js
let chunks = [];

mediaRecorder.ondataavailable = (e) => {
  chunks.push(e.data);
};
```

> [!NOTE]
> Trình duyệt sẽ kích hoạt các sự kiện `dataavailable` khi cần, nhưng nếu bạn muốn can thiệp, bạn cũng có thể bao gồm timeslice khi gọi phương thức `start()`, ví dụ `start(10000)`, để kiểm soát khoảng thời gian này, hoặc gọi {{domxref("MediaRecorder.requestData()")}} để kích hoạt sự kiện khi bạn cần.

Cuối cùng, chúng ta sử dụng phương thức {{domxref("MediaRecorder.stop()")}} để dừng ghi khi nút dừng được nhấn, và hoàn thiện {{domxref("Blob")}} sẵn sàng để sử dụng ở nơi khác trong ứng dụng.

```js
stop.onclick = () => {
  mediaRecorder.stop();
  console.log(mediaRecorder.state);
  console.log("recorder stopped");
  record.style.background = "";
  record.style.color = "";
};
```

Lưu ý rằng việc ghi cũng có thể dừng tự nhiên nếu luồng phương tiện kết thúc (ví dụ nếu bạn đang lấy một track bài hát và track kết thúc, hoặc người dùng dừng chia sẻ micrô của họ).

## Lấy và sử dụng blob

Khi ghi dừng, thuộc tính `state` trả về giá trị "inactive", và sự kiện stop được kích hoạt. Chúng ta đăng ký trình xử lý sự kiện cho điều này bằng cách sử dụng {{domxref("mediaRecorder.stop_event", "onstop")}}, và hoàn thiện blob của chúng ta từ tất cả các đoạn chúng ta đã nhận:

```js
mediaRecorder.onstop = (e) => {
  console.log("recorder stopped");

  const clipName = prompt("Enter a name for your sound clip");

  const clipContainer = document.createElement("article");
  const clipLabel = document.createElement("p");
  const audio = document.createElement("audio");
  const deleteButton = document.createElement("button");

  clipContainer.classList.add("clip");
  audio.setAttribute("controls", "");
  deleteButton.textContent = "Delete";
  clipLabel.textContent = clipName;

  clipContainer.appendChild(audio);
  clipContainer.appendChild(clipLabel);
  clipContainer.appendChild(deleteButton);
  soundClips.appendChild(clipContainer);

  const blob = new Blob(chunks, { type: "audio/ogg; codecs=opus" });
  chunks = [];
  const audioURL = window.URL.createObjectURL(blob);
  audio.src = audioURL;

  deleteButton.onclick = (e) => {
    let evtTgt = e.target;
    evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);
  };
};
```

Hãy xem mã ở trên và xem những gì đang xảy ra.

Đầu tiên, chúng ta hiển thị lời nhắc yêu cầu người dùng đặt tên cho clip của họ.

Tiếp theo, chúng ta tạo cấu trúc HTML như sau, chèn nó vào container clip của chúng ta, là phần tử {{htmlelement("article")}}.

```html
<article class="clip">
  <audio controls></audio>
  <p>your clip name</p>
  <button>Delete</button>
</article>
```

Sau đó, chúng ta tạo {{domxref("Blob")}} kết hợp từ các đoạn âm thanh đã ghi, và tạo URL đối tượng trỏ vào nó, sử dụng `window.URL.createObjectURL(blob)`. Sau đó chúng ta đặt giá trị thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/audio#src) của phần tử {{HTMLElement("audio")}} thành URL đối tượng, để khi nút phát được nhấn trên trình phát âm thanh, nó sẽ phát `Blob`.

Cuối cùng, chúng ta đặt trình xử lý `onclick` trên nút xóa để là hàm xóa toàn bộ cấu trúc HTML clip.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API) landing page
- {{domxref("MediaDevices.getUserMedia()")}}
