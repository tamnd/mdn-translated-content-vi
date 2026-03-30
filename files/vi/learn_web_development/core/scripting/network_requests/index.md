---
title: Thực hiện yêu cầu mạng với JavaScript
short-title: Yêu cầu mạng
slug: Learn_web_development/Core/Scripting/Network_requests
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Image_gallery","Learn_web_development/Core/Scripting/JSON", "Learn_web_development/Core/Scripting")}}

Một nhiệm vụ rất phổ biến khác trong các trang web và ứng dụng hiện đại là thực hiện các yêu cầu mạng để lấy các mục dữ liệu riêng lẻ từ máy chủ để cập nhật các phần của trang web mà không cần tải toàn bộ trang mới. Chi tiết nhỏ bé dường như này đã có tác động lớn đến hiệu suất và hành vi của các trang web, vì vậy trong bài viết này, chúng ta sẽ giải thích khái niệm và xem xét các công nghệ làm cho điều đó trở nên khả thi: cụ thể là [Fetch API](/en-US/docs/Web/API/Fetch_API).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">kiến thức cơ bản về CSS</a>, quen thuộc với kiến thức cơ bản về JavaScript như đã trình bày trong các bài học trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các yêu cầu mạng bất đồng bộ, đây là trường hợp sử dụng JavaScript bất đồng bộ phổ biến nhất trên web.</li>
          <li>Các loại tài nguyên phổ biến được tải về từ mạng: JSON, các tài sản phương tiện, dữ liệu từ các API RESTful.</li>
          <li>Cách sử dụng <code>fetch()</code> để thực hiện các yêu cầu mạng bất đồng bộ.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Vấn đề ở đây là gì?

Một trang web bao gồm một trang HTML và (thường) nhiều tệp khác, chẳng hạn như stylesheets, scripts và hình ảnh. Mô hình cơ bản của việc tải trang trên Web là trình duyệt của bạn thực hiện một hoặc nhiều yêu cầu HTTP đến máy chủ để lấy các tệp cần thiết để hiển thị trang, và máy chủ phản hồi bằng các tệp được yêu cầu. Nếu bạn truy cập trang khác, trình duyệt yêu cầu các tệp mới và máy chủ phản hồi với chúng.

![Tải trang truyền thống](traditional-loading.svg)

Mô hình này hoạt động tốt cho nhiều trang web. Nhưng hãy xem xét một trang web hướng dữ liệu nhiều. Ví dụ, một trang web thư viện như [Thư viện Công cộng Vancouver](https://www.vpl.ca/). Trong số những thứ khác, bạn có thể nghĩ về một trang web như thế này như giao diện người dùng cho cơ sở dữ liệu. Nó có thể cho phép bạn tìm kiếm một thể loại sách cụ thể, hoặc có thể hiển thị cho bạn các gợi ý về những cuốn sách bạn có thể thích, dựa trên các sách bạn đã mượn trước đây. Khi bạn làm điều này, nó cần cập nhật trang với bộ sách mới để hiển thị. Nhưng lưu ý rằng hầu hết nội dung trang — bao gồm các mục như tiêu đề trang, thanh bên và chân trang — vẫn giống nhau.

Vấn đề với mô hình truyền thống ở đây là chúng ta sẽ phải tải và tải lại toàn bộ trang, ngay cả khi chúng ta chỉ cần cập nhật một phần của nó. Điều này không hiệu quả và có thể dẫn đến trải nghiệm người dùng kém.

Vì vậy thay vì mô hình truyền thống, nhiều trang web sử dụng các JavaScript API để yêu cầu dữ liệu từ máy chủ và cập nhật nội dung trang mà không tải trang. Vì vậy khi người dùng tìm kiếm sản phẩm mới, trình duyệt chỉ yêu cầu dữ liệu cần thiết để cập nhật trang — chẳng hạn như bộ sách mới để hiển thị.

![Sử dụng fetch để cập nhật trang](fetch-update.svg)

API chính ở đây là [Fetch API](/en-US/docs/Web/API/Fetch_API). Điều này cho phép JavaScript chạy trong trang thực hiện yêu cầu [HTTP](/en-US/docs/Web/HTTP) đến máy chủ để lấy các tài nguyên cụ thể. Khi máy chủ cung cấp chúng, JavaScript có thể sử dụng dữ liệu để cập nhật trang, thường bằng cách sử dụng [API thao tác DOM](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting). Dữ liệu được yêu cầu thường là [JSON](/en-US/docs/Learn_web_development/Core/Scripting/JSON), đây là định dạng tốt để truyền dữ liệu có cấu trúc, nhưng cũng có thể là HTML hoặc chỉ là văn bản.

Đây là mẫu phổ biến cho các trang web hướng dữ liệu như Amazon, YouTube, eBay, v.v. Với mô hình này:

- Cập nhật trang nhanh hơn nhiều và bạn không phải chờ trang làm mới, có nghĩa là trang web cảm thấy nhanh hơn và phản hồi tốt hơn.
- Ít dữ liệu được tải xuống trong mỗi lần cập nhật, có nghĩa là ít lãng phí băng thông. Đây có thể không phải là vấn đề lớn trên máy tính để bàn có kết nối băng thông rộng, nhưng đây là vấn đề lớn trên các thiết bị di động và ở các quốc gia không có dịch vụ internet nhanh phổ biến.

> [!NOTE]
> Trong thời kỳ đầu, kỹ thuật chung này được gọi là [Asynchronous](/en-US/docs/Glossary/Asynchronous) JavaScript và XML ([AJAX](/en-US/docs/Glossary/AJAX)), vì nó có xu hướng yêu cầu dữ liệu XML. Đây thường không phải là trường hợp ngày nay (bạn có thể sẽ yêu cầu JSON nhiều hơn), nhưng kết quả vẫn giống nhau, và thuật ngữ "AJAX" vẫn thường được sử dụng để mô tả kỹ thuật này.

Để tăng tốc hơn nữa, một số trang web cũng lưu trữ tài sản và dữ liệu trên máy tính của người dùng khi chúng được yêu cầu lần đầu, có nghĩa là trong các lần truy cập tiếp theo họ sử dụng các phiên bản cục bộ thay vì tải xuống bản sao mới mỗi khi trang được tải lần đầu. Nội dung chỉ được tải lại từ máy chủ khi nó đã được cập nhật.

## Fetch API

Trong phần này, chúng ta sẽ đi qua một vài ví dụ về Fetch API.

Các ví dụ dưới đây có mức độ phức tạp nhất định, và cho thấy cách sử dụng Fetch API trong một số ngữ cảnh thực tế. Nếu bạn chưa bao giờ sử dụng fetch trước đây, bạn có thể muốn bắt đầu bằng cách làm việc qua hướng dẫn tương tác [First fetch](https://scrimba.com/frontend-path-c0j/~0lu?via=mdn) của Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>, cung cấp hướng dẫn giới thiệu rất đơn giản.

### Tải nội dung văn bản

Trong ví dụ này, chúng ta sẽ yêu cầu dữ liệu từ một vài tệp văn bản khác nhau và sử dụng chúng để điền vào khu vực nội dung.

Loạt tệp này sẽ đóng vai trò là cơ sở dữ liệu giả của chúng ta; trong ứng dụng thực tế, chúng ta có thể sẽ sử dụng ngôn ngữ phía máy chủ như PHP, Python hoặc Node để yêu cầu dữ liệu từ cơ sở dữ liệu. Tuy nhiên ở đây, chúng ta muốn giữ cho nó đơn giản và tập trung vào phần phía máy khách.

Để bắt đầu ví dụ này, hãy tạo bản sao cục bộ của [fetch-start.html](https://github.com/mdn/learning-area/blob/main/javascript/apis/fetching-data/fetch-start.html) và bốn tệp văn bản — [verse1.txt](https://github.com/mdn/learning-area/blob/main/javascript/apis/fetching-data/verse1.txt), [verse2.txt](https://github.com/mdn/learning-area/blob/main/javascript/apis/fetching-data/verse2.txt), [verse3.txt](https://github.com/mdn/learning-area/blob/main/javascript/apis/fetching-data/verse3.txt), và [verse4.txt](https://github.com/mdn/learning-area/blob/main/javascript/apis/fetching-data/verse4.txt) — trong một thư mục mới trên máy tính của bạn. Trong ví dụ này, chúng ta sẽ tải về một đoạn thơ khác nhau (mà bạn có thể nhận ra) khi nó được chọn trong menu thả xuống.

Ngay bên trong phần tử {{htmlelement("script")}}, thêm đoạn mã sau. Đoạn này lưu tham chiếu đến các phần tử {{htmlelement("select")}} và {{htmlelement("pre")}} và thêm bộ lắng nghe vào phần tử `<select>`, sao cho khi người dùng chọn một giá trị mới, giá trị mới được chuyển đến hàm có tên là `updateDisplay()` dưới dạng tham số.

```js
const verseChoose = document.querySelector("select");
const poemDisplay = document.querySelector("pre");

verseChoose.addEventListener("change", () => {
  const verse = verseChoose.value;
  updateDisplay(verse);
});
```

Hãy định nghĩa hàm `updateDisplay()` của chúng ta. Trước tiên, đặt đoạn sau bên dưới khối mã trước của bạn — đây là phần vỏ trống của hàm.

```js-nolint
function updateDisplay(verse) {

}
```

Chúng ta sẽ bắt đầu hàm bằng cách xây dựng URL tương đối trỏ đến tệp văn bản chúng ta muốn tải, vì chúng ta sẽ cần nó sau. Giá trị của phần tử {{htmlelement("select")}} tại bất kỳ thời điểm nào cũng giống như văn bản bên trong phần tử {{htmlelement("option")}} được chọn (trừ khi bạn chỉ định một giá trị khác trong thuộc tính value) — vì vậy ví dụ "Verse 1". Tệp văn bản đoạn thơ tương ứng là "verse1.txt", và nằm trong cùng thư mục với tệp HTML, do đó chỉ cần tên tệp.

Tuy nhiên, máy chủ web có xu hướng phân biệt chữ hoa và chữ thường, và tên tệp không có khoảng trắng. Để chuyển đổi "Verse 1" thành "verse1.txt", chúng ta cần chuyển đổi 'V' thành chữ thường, xóa khoảng trắng và thêm ".txt" vào cuối. Điều này có thể được thực hiện với {{jsxref("String.replace", "replace()")}}, {{jsxref("String.toLowerCase", "toLowerCase()")}}, và [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals). Thêm các dòng sau bên trong hàm `updateDisplay()` của bạn:

```js
verse = verse.replace(" ", "").toLowerCase();
const url = `${verse}.txt`;
```

Cuối cùng chúng ta đã sẵn sàng sử dụng Fetch API:

```js
// Call `fetch()`, passing in the URL.
fetch(url)
  // fetch() returns a promise. When we have received a response from the server,
  // the promise's `then()` handler is called with the response.
  .then((response) => {
    // Our handler throws an error if the request did not succeed.
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    // Otherwise (if the response succeeded), our handler fetches the response
    // as text by calling response.text(), and immediately returns the promise
    // returned by `response.text()`.
    return response.text();
  })
  // When response.text() has succeeded, the `then()` handler is called with
  // the text, and we copy it into the `poemDisplay` box.
  .then((text) => {
    poemDisplay.textContent = text;
  })
  // Catch any errors that might happen, and display a message
  // in the `poemDisplay` box.
  .catch((error) => {
    poemDisplay.textContent = `Could not fetch verse: ${error}`;
  });
```

Có khá nhiều thứ cần phân tích ở đây.

Đầu tiên, điểm vào của Fetch API là hàm toàn cục gọi là {{domxref("Window/fetch", "fetch()")}}, nhận URL làm tham số (nó nhận một tham số tùy chọn khác cho các cài đặt tùy chỉnh, nhưng chúng ta không sử dụng ở đây).

Tiếp theo, `fetch()` là API bất đồng bộ trả về {{jsxref("Promise")}}. Nếu bạn không biết điều đó là gì, hãy đọc module về [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS), và đặc biệt là bài học về [promises](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises), sau đó quay lại đây. Bạn sẽ thấy bài viết đó cũng nói về API `fetch()`!

Vì `fetch()` trả về một promise, chúng ta truyền một hàm vào phương thức {{jsxref("Promise/then", "then()")}} của promise được trả về. Phương thức này sẽ được gọi khi yêu cầu HTTP đã nhận được phản hồi từ máy chủ. Trong trình xử lý, chúng ta kiểm tra xem yêu cầu có thành công không và ném lỗi nếu không. Nếu không, chúng ta gọi {{domxref("Response/text", "response.text()")}}, để lấy thân phản hồi dưới dạng văn bản.

Hóa ra `response.text()` cũng _bất đồng bộ_, vì vậy chúng ta trả về promise mà nó trả về, và truyền một hàm vào phương thức `then()` của promise mới này. Hàm này sẽ được gọi khi văn bản phản hồi sẵn sàng, và bên trong nó chúng ta sẽ cập nhật khối `<pre>` với văn bản.

Cuối cùng, chúng ta chuỗi trình xử lý {{jsxref("Promise/catch", "catch()")}} ở cuối, để bắt bất kỳ lỗi nào được ném ra trong một trong các hàm bất đồng bộ chúng ta đã gọi hoặc các trình xử lý của chúng.

Một vấn đề với ví dụ như hiện tại là nó sẽ không hiển thị bất kỳ bài thơ nào khi nó lần đầu tải. Để sửa điều này, hãy thêm hai dòng sau ở cuối mã của bạn (ngay phía trên thẻ đóng `</script>`) để tải đoạn thơ 1 mặc định, và đảm bảo phần tử {{htmlelement("select")}} luôn hiển thị giá trị đúng:

```js
updateDisplay("Verse 1");
verseChoose.value = "Verse 1";
```

#### Phục vụ ví dụ của bạn từ máy chủ

Các trình duyệt hiện đại sẽ không chạy các yêu cầu HTTP nếu bạn chỉ chạy ví dụ từ một tệp cục bộ. Điều này là do các hạn chế bảo mật (để biết thêm về bảo mật web, hãy đọc [Bảo mật trang web](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security)).

Để giải quyết vấn đề này, chúng ta cần kiểm tra ví dụ bằng cách chạy nó thông qua máy chủ web cục bộ. Để tìm hiểu cách thực hiện điều này, xem [Làm thế nào để thiết lập máy chủ kiểm tra cục bộ?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server).

### Cửa hàng lon

Trong ví dụ này, chúng ta đã tạo một trang web mẫu có tên The Can Store — đây là siêu thị hư cấu chỉ bán hàng đóng hộp. Bạn có thể tìm thấy [ví dụ này trực tiếp trên GitHub](https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/), và [xem mã nguồn](https://github.com/mdn/learning-area/tree/main/javascript/apis/fetching-data/can-store).

![Trang web thương mại điện tử giả hiển thị các tùy chọn tìm kiếm ở cột bên trái và kết quả tìm kiếm sản phẩm ở cột bên phải.](can-store.png)

Theo mặc định, trang web hiển thị tất cả các sản phẩm, nhưng bạn có thể sử dụng các điều khiển biểu mẫu ở cột bên trái để lọc chúng theo danh mục, hoặc từ khóa tìm kiếm, hoặc cả hai.

Có khá nhiều mã phức tạp xử lý việc lọc sản phẩm theo danh mục và từ khóa tìm kiếm, thao tác chuỗi để dữ liệu hiển thị chính xác trong UI, v.v. Chúng ta sẽ không thảo luận tất cả trong bài viết, nhưng bạn có thể tìm thấy các bình luận rộng rãi trong mã (xem [can-script.js](https://github.com/mdn/learning-area/blob/main/javascript/apis/fetching-data/can-store/can-script.js)).

Tuy nhiên, chúng ta sẽ giải thích mã Fetch.

Khối đầu tiên sử dụng Fetch có thể được tìm thấy ở đầu JavaScript:

```js
fetch("products.json")
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return response.json();
  })
  .then((json) => initialize(json))
  .catch((err) => console.error(`Fetch problem: ${err.message}`));
```

Hàm `fetch()` trả về một promise. Nếu hoàn thành thành công, hàm bên trong khối `.then()` đầu tiên chứa `response` được trả về từ mạng.

Bên trong hàm này chúng ta:

- kiểm tra xem máy chủ có trả về lỗi không (chẳng hạn như [`404 Not Found`](/en-US/docs/Web/HTTP/Reference/Status/404)). Nếu có, chúng ta ném lỗi.
- gọi {{domxref("Response.json","json()")}} trên phản hồi. Điều này sẽ lấy dữ liệu dưới dạng [đối tượng JSON](/en-US/docs/Learn_web_development/Core/Scripting/JSON). Chúng ta trả về promise được trả về bởi `response.json()`.

Tiếp theo chúng ta truyền một hàm vào phương thức `then()` của promise được trả về đó. Hàm này sẽ được truyền một đối tượng chứa dữ liệu phản hồi dưới dạng JSON, mà chúng ta truyền vào hàm `initialize()`. Chính `initialize()` bắt đầu quá trình hiển thị tất cả các sản phẩm trong giao diện người dùng.

Để xử lý lỗi, chúng ta chuỗi một khối `.catch()` vào cuối chuỗi. Điều này chạy nếu promise thất bại vì lý do nào đó. Bên trong nó, chúng ta bao gồm một hàm được truyền dưới dạng tham số, một đối tượng `err`. Đối tượng `err` này có thể được sử dụng để báo cáo bản chất của lỗi đã xảy ra, trong trường hợp này chúng ta thực hiện với một `console.error()` đơn giản.

Tuy nhiên, một trang web hoàn chỉnh sẽ xử lý lỗi này một cách thanh lịch hơn bằng cách hiển thị thông báo trên màn hình của người dùng và có thể cung cấp các tùy chọn để khắc phục tình trạng, nhưng chúng ta không cần gì hơn một `console.error()` đơn giản.

Bạn có thể tự kiểm tra trường hợp thất bại:

<!-- cSpell:ignore produc -->

1. Tạo bản sao cục bộ của các tệp ví dụ.
2. Chạy mã qua máy chủ web (như mô tả ở trên, trong [Phục vụ ví dụ của bạn từ máy chủ](#serving_your_example_from_a_server)).
3. Sửa đổi đường dẫn đến tệp đang được tải về, thành thứ như 'produc.json' (hãy chắc chắn nó bị viết sai).
4. Bây giờ hãy tải tệp index trong trình duyệt của bạn (qua `localhost:8000`) và xem trong bảng điều khiển nhà phát triển trình duyệt của bạn. Bạn sẽ thấy thông báo tương tự như "Fetch problem: HTTP error: 404".

Khối Fetch thứ hai có thể được tìm thấy bên trong hàm `fetchBlob()`:

```js
fetch(url)
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return response.blob();
  })
  .then((blob) => showProduct(blob, product))
  .catch((err) => console.error(`Fetch problem: ${err.message}`));
```

Điều này hoạt động theo cách gần giống như cái trước, ngoại trừ thay vì sử dụng {{domxref("Response.json","json()")}}, chúng ta sử dụng {{domxref("Response.blob","blob()")}}. Trong trường hợp này chúng ta muốn trả về phản hồi của mình dưới dạng tệp hình ảnh, và định dạng dữ liệu chúng ta sử dụng cho điều đó là [Blob](/en-US/docs/Web/API/Blob) (thuật ngữ là từ viết tắt của "Binary Large Object" và về cơ bản có thể được sử dụng để đại diện cho các đối tượng giống tệp lớn, chẳng hạn như hình ảnh hoặc tệp video).

Sau khi chúng ta nhận được blob thành công, chúng ta truyền nó vào hàm `showProduct()` của mình, hàm này hiển thị nó.

## XMLHttpRequest API

Đôi khi, đặc biệt trong mã cũ hơn, bạn sẽ thấy một API khác gọi là [`XMLHttpRequest`](/en-US/docs/Web/API/XMLHttpRequest) (thường được viết tắt là "XHR") được sử dụng để thực hiện các yêu cầu HTTP. Điều này có trước Fetch, và thực sự là API đầu tiên được sử dụng rộng rãi để thực hiện AJAX. Chúng tôi khuyến nghị bạn sử dụng Fetch nếu có thể: đây là API đơn giản hơn và có nhiều tính năng hơn `XMLHttpRequest`. Chúng ta sẽ không đi qua ví dụ sử dụng `XMLHttpRequest`, nhưng chúng ta sẽ cho bạn thấy phiên bản `XMLHttpRequest` của yêu cầu cửa hàng lon đầu tiên trông như thế nào:

```js
const request = new XMLHttpRequest();

try {
  request.open("GET", "products.json");

  request.responseType = "json";

  request.addEventListener("load", () => initialize(request.response));
  request.addEventListener("error", () => console.error("XHR error"));

  request.send();
} catch (error) {
  console.error(`XHR error ${request.status}`);
}
```

Có năm giai đoạn cho điều này:

1. Tạo một đối tượng `XMLHttpRequest` mới.
2. Gọi phương thức [`open()`](/en-US/docs/Web/API/XMLHttpRequest/open) của nó để khởi tạo.
3. Thêm bộ lắng nghe sự kiện vào sự kiện [`load`](/en-US/docs/Web/API/XMLHttpRequestEventTarget/load_event) của nó, sự kiện này kích hoạt khi phản hồi đã hoàn thành thành công. Trong bộ lắng nghe chúng ta gọi `initialize()` với dữ liệu.
4. Thêm bộ lắng nghe sự kiện vào sự kiện [`error`](/en-US/docs/Web/API/XMLHttpRequestEventTarget/error_event) của nó, sự kiện kích hoạt khi yêu cầu gặp lỗi.
5. Gửi yêu cầu.

Chúng ta cũng phải bọc toàn bộ mọi thứ trong khối [try...catch](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch), để xử lý bất kỳ lỗi nào được ném ra bởi `open()` hoặc `send()`.

Hy vọng rằng bạn nghĩ Fetch API là một cải tiến so với điều này. Đặc biệt, hãy xem cách chúng ta phải xử lý lỗi ở hai nơi khác nhau.

## Tóm tắt

Bài viết này cho thấy cách bắt đầu làm việc với Fetch để tải về dữ liệu từ máy chủ.

## Xem thêm

Tuy nhiên có rất nhiều chủ đề khác nhau được thảo luận trong bài viết này, chỉ thực sự đã làm xước bề mặt. Để biết thêm chi tiết về các chủ đề này, hãy thử các bài viết sau:

- [Using Fetch](/en-US/docs/Web/API/Fetch_API/Using_Fetch)
- [Promises](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)
- [Working with JSON data](/en-US/docs/Learn_web_development/Core/Scripting/JSON)
- [An overview of HTTP](/en-US/docs/Web/HTTP/Guides/Overview)
- [Server-side website programming](/en-US/docs/Learn_web_development/Extensions/Server-side)

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Image_gallery","Learn_web_development/Core/Scripting/JSON", "Learn_web_development/Core/Scripting")}}
