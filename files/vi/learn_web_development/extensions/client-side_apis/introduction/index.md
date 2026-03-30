---
title: Giới thiệu về API web
short-title: Giới thiệu
slug: Learn_web_development/Extensions/Client-side_APIs/Introduction
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Client-side_APIs/Video_and_audio_APIs", "Learn_web_development/Extensions/Client-side_APIs")}}

Đầu tiên, chúng ta sẽ bắt đầu bằng cách nhìn nhận các API ở cấp độ cao — chúng là gì, chúng hoạt động như thế nào, cách sử dụng chúng trong mã của bạn, và chúng được cấu trúc như thế nào? Chúng ta cũng sẽ xem xét các lớp API chính là gì và chúng có những ứng dụng như thế nào.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, đặc biệt là <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">kiến thức cơ bản về đối tượng JavaScript</a> và kiến thức cốt lõi về API như <a href="/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting">lập trình DOM</a> và <a href="/en-US/docs/Learn_web_development/Core/Scripting/Network_requests">Yêu cầu mạng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>API Web là gì và bạn có thể làm gì với chúng.</li>
          <li>Cách sử dụng API.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## API là gì?

Giao diện lập trình ứng dụng (API) là các cấu trúc được cung cấp trong các ngôn ngữ lập trình để cho phép các nhà phát triển tạo ra các chức năng phức tạp dễ dàng hơn. Chúng trừu tượng hóa mã phức tạp hơn khỏi bạn, cung cấp một số cú pháp dễ sử dụng hơn để thay thế.

Như một ví dụ thực tế, hãy nghĩ về nguồn điện trong nhà, căn hộ hoặc nơi ở khác của bạn. Nếu bạn muốn sử dụng một thiết bị trong nhà, bạn chỉ cần cắm nó vào ổ cắm và nó hoạt động. Bạn không cố gắng kết nối trực tiếp nó vào nguồn điện — làm như vậy sẽ rất kém hiệu quả và, nếu bạn không phải là thợ điện, sẽ khó khăn và nguy hiểm khi thực hiện.

![Two multi-plug holders are plugged into two different plug outlet sockets. Each multi-plug holder has a plug slot on it's top and to it's front side. Two plugs are plugged into each multi-plug holder.](plug-socket.png)

_Nguồn ảnh: [Overloaded plug socket](https://www.flickr.com/photos/easy-pics/9518184890/in/photostream/lightbox/) của [The Clear Communication People](https://www.flickr.com/photos/easy-pics/), trên Flickr._

Tương tự, nếu bạn muốn, chẳng hạn, lập trình một số đồ họa 3D, sẽ dễ dàng hơn nhiều khi thực hiện bằng cách sử dụng API được viết bằng ngôn ngữ cấp cao hơn như JavaScript hoặc Python, thay vì cố gắng viết trực tiếp mã cấp thấp (chẳng hạn C hoặc C++) trực tiếp điều khiển GPU của máy tính hoặc các hàm đồ họa khác.

> [!NOTE]
> Xem thêm [mục thuật ngữ API](/en-US/docs/Glossary/API) để biết thêm mô tả.

### API trong JavaScript phía máy khách

JavaScript phía máy khách, đặc biệt, có nhiều API có sẵn — chúng không phải là một phần của ngôn ngữ JavaScript, mà được xây dựng trên ngôn ngữ JavaScript cốt lõi, cung cấp cho bạn thêm các siêu năng lực để sử dụng trong mã JavaScript của bạn. Chúng thường thuộc hai loại:

- **API trình duyệt** được tích hợp vào trình duyệt web của bạn và có thể tiết lộ dữ liệu từ trình duyệt và môi trường máy tính xung quanh, và thực hiện những việc phức tạp hữu ích với nó. Ví dụ, [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) cung cấp các cấu trúc JavaScript để thao tác âm thanh trong trình duyệt — lấy một bản nhạc, thay đổi âm lượng của nó, áp dụng các hiệu ứng, v.v. Ở phía sau, trình duyệt thực sự đang sử dụng một số mã cấp thấp phức tạp hơn (ví dụ: C++ hoặc Rust) để thực hiện xử lý âm thanh thực tế. Nhưng một lần nữa, sự phức tạp này được API trừu tượng hóa khỏi bạn.
- **API bên thứ ba** không được tích hợp vào trình duyệt theo mặc định, và bạn thường phải truy xuất mã và thông tin của chúng từ đâu đó trên Web. Ví dụ, [Google Maps API](https://developers.google.com/maps/documentation/javascript) cho phép bạn làm những việc như hiển thị bản đồ tương tác đến văn phòng của bạn trên trang web của bạn. Nó cung cấp một tập hợp các cấu trúc đặc biệt mà bạn có thể sử dụng để truy vấn dịch vụ Google Maps và trả về thông tin cụ thể.

![A screenshot of the browser with the home page of firefox browser open. There are APIs built into the browser by default. Third party APIs are not built into the browser by default. Their code and information has to be retrieved from somewhere on the web to utilize them.](browser.png)

### Mối quan hệ giữa JavaScript, API và các công cụ JavaScript khác

Vì vậy, ở trên, chúng ta đã nói về API JavaScript phía máy khách là gì, và chúng liên quan đến ngôn ngữ JavaScript như thế nào. Hãy tóm tắt điều này để làm rõ hơn, và cũng đề cập đến nơi mà các công cụ JavaScript khác phù hợp:

- JavaScript — Ngôn ngữ kịch bản cấp cao được tích hợp vào trình duyệt cho phép bạn triển khai chức năng trên các trang web/ứng dụng. Lưu ý rằng JavaScript cũng có sẵn trong các môi trường lập trình khác, chẳng hạn như [Node](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction).
- API trình duyệt — Các cấu trúc được tích hợp vào trình duyệt đặt trên ngôn ngữ JavaScript và cho phép bạn triển khai chức năng dễ dàng hơn.
- API bên thứ ba — Các cấu trúc được tích hợp vào các nền tảng bên thứ ba (ví dụ: Disqus, Facebook) cho phép bạn sử dụng một số chức năng của các nền tảng đó trong các trang web của riêng bạn (ví dụ: hiển thị bình luận Disqus của bạn trên một trang web).
- Thư viện JavaScript — Thường là một hoặc nhiều tệp JavaScript chứa [các hàm tùy chỉnh](/en-US/docs/Learn_web_development/Core/Scripting/Functions) mà bạn có thể đính kèm vào trang web của mình để tăng tốc hoặc cho phép viết các chức năng thông thường. Các ví dụ bao gồm jQuery, Mootools và React.
- Khung JavaScript — Bước tiếp theo so với thư viện, các khung JavaScript (ví dụ: Angular và Ember) có xu hướng là các gói HTML, CSS, JavaScript và các công nghệ khác mà bạn cài đặt và sau đó sử dụng để viết toàn bộ ứng dụng web từ đầu. Sự khác biệt chính giữa thư viện và khung là "Đảo ngược kiểm soát". Khi gọi một phương thức từ thư viện, nhà phát triển có quyền kiểm soát. Với khung, quyền kiểm soát bị đảo ngược: khung gọi mã của nhà phát triển.

## API có thể làm gì?

Có rất nhiều API có sẵn trong các trình duyệt hiện đại cho phép bạn làm rất nhiều điều trong mã của mình. Bạn có thể xem điều này bằng cách xem [trang chỉ mục API MDN](/en-US/docs/Web/API).

### Các API trình duyệt thông dụng

Đặc biệt, các loại API trình duyệt phổ biến nhất mà bạn sẽ sử dụng (và chúng ta sẽ đề cập chi tiết hơn trong mô-đun này) là:

- **API để thao tác tài liệu** được tải vào trình duyệt. Ví dụ rõ ràng nhất là [DOM (Document Object Model) API](/en-US/docs/Web/API/Document_Object_Model), cho phép bạn thao tác HTML và CSS — tạo, xóa và thay đổi HTML, áp dụng động các kiểu mới cho trang của bạn, v.v. Mỗi khi bạn thấy một cửa sổ pop-up xuất hiện trên một trang hoặc một số nội dung mới được hiển thị, đó là DOM đang hoạt động. Tìm hiểu thêm về các loại API này trong [Giới thiệu về lập trình DOM](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting).
- **Các API lấy dữ liệu từ máy chủ** để cập nhật các phần nhỏ của trang web một cách độc lập được sử dụng rất phổ biến. Chi tiết nhỏ này có tác động lớn đến hiệu suất và hành vi của các trang web — nếu bạn chỉ cần cập nhật một danh sách chứng khoán hoặc danh sách các câu chuyện mới có sẵn, làm điều đó ngay lập tức mà không cần tải lại toàn bộ trang từ máy chủ có thể làm cho trang web hoặc ứng dụng cảm thấy phản hồi nhanh hơn. API chính được sử dụng cho việc này là [Fetch API](/en-US/docs/Web/API/Fetch_API), mặc dù mã cũ hơn vẫn có thể sử dụng API [`XMLHttpRequest`](/en-US/docs/Web/API/XMLHttpRequest). Bạn cũng có thể gặp thuật ngữ **AJAX**, mô tả kỹ thuật này. Tìm hiểu thêm về các API như vậy trong [Tạo yêu cầu mạng với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests).
- **Các API để vẽ và thao tác đồ họa** được hỗ trợ rộng rãi trong các trình duyệt — phổ biến nhất là [Canvas](/en-US/docs/Web/API/Canvas_API) và [WebGL](/en-US/docs/Web/API/WebGL_API), cho phép bạn lập trình cập nhật dữ liệu pixel chứa trong phần tử HTML {{htmlelement("canvas")}} để tạo cảnh 2D và 3D. Ví dụ, bạn có thể vẽ các hình như hình chữ nhật hoặc hình tròn, nhập một hình ảnh vào canvas và áp dụng bộ lọc cho nó như sepia hoặc thang độ xám bằng cách sử dụng Canvas API, hoặc tạo một cảnh 3D phức tạp với ánh sáng và kết cấu bằng WebGL. Các API như vậy thường được kết hợp với các API để tạo vòng lặp hoạt ảnh (chẳng hạn như {{domxref("window.requestAnimationFrame()")}}) và các API khác để tạo các cảnh cập nhật liên tục như hoạt hình và trò chơi.
- **[Các API âm thanh và video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery)** như {{domxref("HTMLMediaElement")}}, [Web Audio API](/en-US/docs/Web/API/Web_Audio_API), và [WebRTC](/en-US/docs/Web/API/WebRTC_API) cho phép bạn thực hiện những điều thực sự thú vị với đa phương tiện như tạo các điều khiển giao diện người dùng tùy chỉnh để phát âm thanh và video, hiển thị các bản nhạc văn bản như phụ đề và phụ đề kép cùng với video của bạn, lấy video từ máy ảnh web của bạn để thao tác qua canvas (xem ở trên) hoặc hiển thị trên máy tính của người khác trong một hội nghị web, hoặc thêm các hiệu ứng vào các bản nhạc âm thanh (như tăng, bóp méo, toàn cảnh, v.v.).
- **Các API thiết bị** cho phép bạn tương tác với phần cứng thiết bị: ví dụ, truy cập GPS của thiết bị để tìm vị trí của người dùng bằng cách sử dụng [Geolocation API](/en-US/docs/Web/API/Geolocation_API).
- **Các API lưu trữ phía máy khách** cho phép bạn lưu trữ dữ liệu ở phía máy khách, vì vậy bạn có thể tạo một ứng dụng sẽ lưu trạng thái của nó giữa các lần tải trang, và thậm chí hoạt động khi thiết bị ngoại tuyến. Có nhiều tùy chọn có sẵn, ví dụ: lưu trữ tên/giá trị đơn giản với [Web Storage API](/en-US/docs/Web/API/Web_Storage_API), và lưu trữ cơ sở dữ liệu phức tạp hơn với [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API).

### Các API bên thứ ba thông dụng

Các API bên thứ ba có nhiều loại; một số API phổ biến mà bạn có thể sử dụng sớm hay muộn là:

- Các API bản đồ, như [Mapquest](https://developer.mapquest.com/) và [Google Maps API](https://developers.google.com/maps/), cho phép bạn thực hiện tất cả các loại thao tác với bản đồ trên các trang web của bạn.
- [Bộ API Facebook](https://developers.facebook.com/docs/), cho phép bạn sử dụng các phần khác nhau của hệ sinh thái Facebook để mang lại lợi ích cho ứng dụng của mình, chẳng hạn như cung cấp đăng nhập ứng dụng bằng Facebook, chấp nhận thanh toán trong ứng dụng, triển khai các chiến dịch quảng cáo được nhắm mục tiêu, v.v.
- [Các API Telegram](https://core.telegram.org/api), cho phép bạn nhúng nội dung từ các kênh Telegram trên trang web của mình, ngoài việc cung cấp hỗ trợ cho bot.
- [YouTube API](https://developers.google.com/youtube/), cho phép bạn nhúng video YouTube trên trang web của mình, tìm kiếm YouTube, xây dựng danh sách phát, và nhiều hơn nữa.
- [Pinterest API](https://developers.pinterest.com/), cung cấp các công cụ để quản lý bảng và ghim Pinterest để bao gồm chúng trong trang web của bạn.
- [Twilio API](https://www.twilio.com/docs), cung cấp một khung để xây dựng chức năng gọi thoại và video vào ứng dụng của bạn, gửi SMS/MMS từ ứng dụng của bạn, và nhiều hơn nữa.
- [Disqus API](https://disqus.com/api/docs/), cung cấp một nền tảng bình luận có thể được tích hợp vào trang web của bạn.
- [Mastodon API](https://docs.joinmastodon.org/api/), cho phép bạn thao tác các tính năng của mạng xã hội Mastodon theo lập trình.
- [IFTTT API](https://ifttt.com/developers), cho phép tích hợp nhiều API thông qua một nền tảng.

## API hoạt động như thế nào?

Các API JavaScript khác nhau hoạt động theo những cách hơi khác nhau, nhưng nhìn chung, chúng có các tính năng chung và các chủ đề tương tự về cách thức hoạt động.

### Chúng dựa trên các đối tượng

Mã của bạn tương tác với các API bằng cách sử dụng một hoặc nhiều [đối tượng JavaScript](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects), đóng vai trò là các vùng chứa cho dữ liệu mà API sử dụng (được chứa trong các thuộc tính đối tượng), và các chức năng mà API cung cấp (được chứa trong các phương thức đối tượng).

> [!NOTE]
> Nếu bạn chưa quen với cách các đối tượng hoạt động, bạn nên quay lại và tìm hiểu về mô-đun [Đối tượng JavaScript](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects) của chúng ta trước khi tiếp tục.

Hãy quay lại ví dụ về Web Audio API — đây là một API khá phức tạp, bao gồm một số đối tượng. Những đối tượng rõ ràng nhất là:

- {{domxref("AudioContext")}}, đại diện cho một [đồ thị âm thanh](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_graphs) có thể được sử dụng để thao tác âm thanh đang phát trong trình duyệt, và có một số phương thức và thuộc tính có sẵn để thao tác âm thanh đó.
- {{domxref("MediaElementAudioSourceNode")}}, đại diện cho phần tử {{htmlelement("audio")}} chứa âm thanh bạn muốn phát và thao tác bên trong ngữ cảnh âm thanh.
- {{domxref("AudioDestinationNode")}}, đại diện cho đích đến của âm thanh, tức là thiết bị trên máy tính của bạn sẽ thực sự xuất nó — thường là loa hoặc tai nghe của bạn.

Vậy các đối tượng này tương tác như thế nào? Nếu bạn xem [ví dụ âm thanh web đơn giản](https://github.com/mdn/learning-area/blob/main/javascript/apis/introduction/web-audio/index.html) ([xem trực tiếp](https://mdn.github.io/learning-area/javascript/apis/introduction/web-audio/)), bạn sẽ thấy HTML sau:

```html
<audio src="outfoxing.mp3"></audio>

<button class="paused">Play</button>
<br />
<input type="range" min="0" max="1" step="0.01" value="1" class="volume" />
```

Trước tiên, chúng ta bao gồm một phần tử `<audio>` để nhúng MP3 vào trang. Chúng ta không bao gồm bất kỳ điều khiển trình duyệt mặc định nào. Tiếp theo, chúng ta bao gồm một {{htmlelement("button")}} mà chúng ta sẽ sử dụng để phát và dừng nhạc, và một phần tử {{htmlelement("input")}} kiểu range, mà chúng ta sẽ sử dụng để điều chỉnh âm lượng của bản nhạc khi đang phát.

Tiếp theo, hãy xem JavaScript cho ví dụ này.

Chúng ta bắt đầu bằng cách tạo một phiên bản `AudioContext` bên trong để thao tác bản nhạc của chúng ta:

```js
const audioCtx = new AudioContext();
```

Tiếp theo, chúng ta tạo các hằng số lưu trữ các tham chiếu đến các phần tử `<audio>`, `<button>` và `<input>` của chúng ta, và sử dụng phương thức {{domxref("AudioContext.createMediaElementSource()")}} để tạo `MediaElementAudioSourceNode` đại diện cho nguồn âm thanh của chúng ta — phần tử `<audio>` sẽ được phát từ:

```js
const audioElement = document.querySelector("audio");
const playBtn = document.querySelector("button");
const volumeSlider = document.querySelector(".volume");

const audioSource = audioCtx.createMediaElementSource(audioElement);
```

Tiếp theo chúng ta bao gồm một vài trình xử lý sự kiện để chuyển đổi giữa phát và tạm dừng khi nút được nhấn và đặt lại màn hình về đầu khi bài hát kết thúc:

```js
// play/pause audio
playBtn.addEventListener("click", () => {
  // check if context is in suspended state (autoplay policy)
  if (audioCtx.state === "suspended") {
    audioCtx.resume();
  }

  // if track is stopped, play it
  if (playBtn.getAttribute("class") === "paused") {
    audioElement.play();
    playBtn.setAttribute("class", "playing");
    playBtn.textContent = "Pause";
    // if track is playing, stop it
  } else if (playBtn.getAttribute("class") === "playing") {
    audioElement.pause();
    playBtn.setAttribute("class", "paused");
    playBtn.textContent = "Play";
  }
});

// if track ends
audioElement.addEventListener("ended", () => {
  playBtn.setAttribute("class", "paused");
  playBtn.textContent = "Play";
});
```

> [!NOTE]
> Một số bạn có thể nhận thấy rằng các phương thức `play()` và `pause()` được sử dụng để phát và tạm dừng bản nhạc không phải là một phần của Web Audio API; chúng là một phần của API {{domxref("HTMLMediaElement")}}, khác nhưng liên quan chặt chẽ.

Tiếp theo, chúng ta tạo một đối tượng {{domxref("GainNode")}} bằng cách sử dụng phương thức {{domxref("BaseAudioContext/createGain", "AudioContext.createGain()")}}, có thể được sử dụng để điều chỉnh âm lượng của âm thanh đi qua nó, và tạo một trình xử lý sự kiện khác thay đổi giá trị gain (âm lượng) của đồ thị âm thanh bất cứ khi nào giá trị thanh trượt thay đổi:

```js
// volume
const gainNode = audioCtx.createGain();

volumeSlider.addEventListener("input", () => {
  gainNode.gain.value = volumeSlider.value;
});
```

Điều cuối cùng cần làm để hoạt động là kết nối các nút khác nhau trong đồ thị âm thanh, được thực hiện bằng phương thức {{domxref("AudioNode.connect()")}} có sẵn trên mỗi loại nút:

```js
audioSource.connect(gainNode).connect(audioCtx.destination);
```

Âm thanh bắt đầu từ nguồn, sau đó được kết nối với nút gain để âm lượng âm thanh có thể được điều chỉnh. Nút gain sau đó được kết nối với nút đích để âm thanh có thể được phát trên máy tính của bạn (thuộc tính {{domxref("BaseAudioContext/destination", "AudioContext.destination")}} đại diện cho bất kỳ {{domxref("AudioDestinationNode")}} mặc định nào có sẵn trên phần cứng máy tính của bạn, ví dụ như loa của bạn).

### Chúng có các điểm vào có thể nhận biết

Khi sử dụng API, bạn nên đảm bảo rằng bạn biết điểm vào của API là ở đâu. Trong Web Audio API, điều này khá đơn giản — đó là đối tượng {{domxref("AudioContext")}}, cần được sử dụng để thực hiện bất kỳ thao tác âm thanh nào.

Document Object Model (DOM) API cũng có một điểm vào đơn giản — các tính năng của nó có xu hướng được tìm thấy trên đối tượng {{domxref("Document")}}, hoặc một phiên bản của phần tử HTML mà bạn muốn ảnh hưởng theo một cách nào đó, ví dụ:

```js
const em = document.createElement("em"); // create a new em element
const para = document.querySelector("p"); // reference an existing p element
em.textContent = "Hello there!"; // give em some text content
para.appendChild(em); // embed em inside para
```

[Canvas API](/en-US/docs/Web/API/Canvas_API) cũng dựa vào việc lấy một đối tượng ngữ cảnh để sử dụng thao tác, mặc dù trong trường hợp này, đó là ngữ cảnh đồ họa thay vì ngữ cảnh âm thanh. Đối tượng ngữ cảnh của nó được tạo bằng cách lấy tham chiếu đến phần tử {{htmlelement("canvas")}} bạn muốn vẽ, và sau đó gọi phương thức {{domxref("HTMLCanvasElement.getContext()")}} của nó:

```js
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
```

Bất cứ điều gì chúng ta muốn làm với canvas sau đó được thực hiện bằng cách gọi các thuộc tính và phương thức của đối tượng ngữ cảnh (là một phiên bản của {{domxref("CanvasRenderingContext2D")}}), ví dụ:

```js
Ball.prototype.draw = function () {
  ctx.beginPath();
  ctx.fillStyle = this.color;
  ctx.arc(this.x, this.y, this.size, 0, 2 * Math.PI);
  ctx.fill();
};
```

> [!NOTE]
> Bạn có thể xem mã này hoạt động trong [bản demo quả bóng nảy](https://github.com/mdn/learning-area/blob/main/javascript/apis/introduction/bouncing-balls.html) (xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/javascript/apis/introduction/bouncing-balls.html) cũng được).

### Chúng thường sử dụng sự kiện để xử lý các thay đổi trạng thái

Chúng ta đã thảo luận về các sự kiện trước đó trong khóa học trong bài viết [Giới thiệu về sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events), bài viết xem xét chi tiết về sự kiện web phía máy khách là gì và cách chúng được sử dụng trong mã của bạn. Nếu bạn chưa quen với cách các sự kiện API web phía máy khách hoạt động, bạn nên đọc bài viết này trước khi tiếp tục.

Một số API web không chứa sự kiện, nhưng hầu hết đều chứa ít nhất một vài sự kiện. Các thuộc tính handler cho phép chúng ta chạy các hàm khi sự kiện kích hoạt thường được liệt kê trong tài liệu tham khảo của chúng ta trong các phần "Trình xử lý sự kiện" riêng biệt.

Chúng ta đã thấy một số trình xử lý sự kiện được sử dụng trong ví dụ Web Audio API ở trên:

```js
// play/pause audio
playBtn.addEventListener("click", () => {
  // check if context is in suspended state (autoplay policy)
  if (audioCtx.state === "suspended") {
    audioCtx.resume();
  }

  // if track is stopped, play it
  if (playBtn.getAttribute("class") === "paused") {
    audioElement.play();
    playBtn.setAttribute("class", "playing");
    playBtn.textContent = "Pause";
    // if track is playing, stop it
  } else if (playBtn.getAttribute("class") === "playing") {
    audioElement.pause();
    playBtn.setAttribute("class", "paused");
    playBtn.textContent = "Play";
  }
});

// if track ends
audioElement.addEventListener("ended", () => {
  playBtn.setAttribute("class", "paused");
  playBtn.textContent = "Play";
});
```

### Chúng có các cơ chế bảo mật bổ sung khi thích hợp

Các tính năng WebAPI phải tuân theo các cân nhắc bảo mật tương tự như JavaScript và các công nghệ web khác (ví dụ [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy)), nhưng đôi khi chúng có các cơ chế bảo mật bổ sung được thiết lập. Ví dụ, một số WebAPI hiện đại hơn sẽ chỉ hoạt động trên các trang được phục vụ qua HTTPS do chúng truyền dữ liệu có khả năng nhạy cảm (các ví dụ bao gồm [Service Workers](/en-US/docs/Web/API/Service_Worker_API) và [Push](/en-US/docs/Web/API/Push_API)).

Ngoài ra, một số WebAPI yêu cầu cấp quyền từ người dùng sau khi các lần gọi đến chúng được thực hiện trong mã của bạn. Ví dụ, [Notifications API](/en-US/docs/Web/API/Notifications_API) yêu cầu quyền bằng cách sử dụng hộp thoại pop-up:

![A screenshot of the notifications pop-up dialog provided by the Notifications API of the browser. 'mdn.github.io' website is asking for permissions to push notifications to the user-agent with an X to close the dialog and drop-down menu of options with 'always receive notifications' selected by default.](notification-permission.png)

Các API Web Audio và {{domxref("HTMLMediaElement")}} phải tuân theo cơ chế bảo mật được gọi là [chính sách tự động phát](/en-US/docs/Web/API/Web_Audio_API/Best_practices#autoplay_policy) — về cơ bản điều này có nghĩa là bạn không thể tự động phát âm thanh khi trang tải — bạn phải cho phép người dùng khởi tạo phát âm thanh thông qua một điều khiển như nút. Điều này được thực hiện vì âm thanh tự động phát thường thực sự gây khó chịu và chúng ta không nên bắt người dùng phải chịu đựng điều đó.

> [!NOTE]
> Tùy thuộc vào mức độ nghiêm ngặt của trình duyệt, các cơ chế bảo mật như vậy thậm chí có thể ngăn ví dụ hoạt động cục bộ, tức là nếu bạn tải tệp ví dụ cục bộ trong trình duyệt thay vì chạy nó từ một máy chủ web. Tại thời điểm viết bài, ví dụ Web Audio API của chúng ta sẽ không hoạt động cục bộ trên Google Chrome — chúng ta phải tải nó lên GitHub trước khi nó hoạt động.

## Tóm tắt

Tại thời điểm này, bạn nên có ý tưởng tốt về API là gì, chúng hoạt động như thế nào, và bạn có thể làm gì với chúng trong mã JavaScript của bạn. Bạn có lẽ đang háo hức để bắt đầu thực sự làm một số điều thú vị với các API cụ thể, vì vậy hãy tiếp tục! Tiếp theo, chúng ta sẽ xem xét các API âm thanh và video.

{{NextMenu("Learn_web_development/Extensions/Client-side_APIs/Video_and_audio_APIs", "Learn_web_development/Extensions/Client-side_APIs")}}
