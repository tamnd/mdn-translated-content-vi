---
title: Hình ảnh HTML
short-title: Hình ảnh
slug: Learn_web_development/Core/Structuring_content/HTML_images
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Structuring_a_page_of_content", "Learn_web_development/Core/Structuring_content/Test_your_skills/Images", "Learn_web_development/Core/Structuring_content")}}

Thuở ban đầu, web chỉ là văn bản, và thực sự khá nhàm chán. May mắn thay, không lâu sau đó khả năng nhúng hình ảnh (và các loại nội dung thú vị hơn khác) vào trong các trang web đã được thêm vào. Trong bài viết này, chúng tôi sẽ xem xét cách sử dụng phần tử {{htmlelement("img")}} một cách chuyên sâu, bao gồm những kiến thức cơ bản, chú thích hình ảnh bằng phụ đề sử dụng {{htmlelement("figure")}}, và trình bày chi tiết về mối quan hệ của nó với {{glossary("CSS")}} background images.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >. Ngữ nghĩa cấp văn bản như <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs"
          >tiêu đề và đoạn văn</a
        > và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Lists"
          >danh sách</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Thuật ngữ "replaced element" — nó có nghĩa là gì?</li>
          <li>Cú pháp thẻ <code>&lt;img&gt;</code> cơ bản</li>
          <li>Sử dụng <code>src</code> để trỏ đến tài nguyên.</li>
          <li>Sử dụng <code>width</code> và <code>height</code>, ví dụ, để tránh các cập nhật UI lắc lư khó chịu một khi hình ảnh đã tải xong và được hiển thị.</li>
          <li>Tối ưu hóa tài sản phương tiện cho web — giữ kích thước tệp nhỏ.</li>
          <li>Hiểu cấp phép tài sản phương tiện — các loại giấy phép khác nhau, cách tuân thủ chúng và cách tìm kiếm các tệp phương tiện được cấp phép thích hợp để sử dụng trong các dự án.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Làm thế nào để đặt hình ảnh lên trang web?

Để đặt hình ảnh trên trang web, chúng ta sử dụng phần tử {{htmlelement("img")}}. Đây là {{Glossary("void element")}} (có nghĩa là, nó không thể có nội dung con nào và không thể có thẻ kết thúc) yêu cầu hai thuộc tính để hữu ích: `src` và `alt`. Thuộc tính `src` chứa URL trỏ đến hình ảnh bạn muốn nhúng vào trang. Cũng như thuộc tính `href` cho các phần tử {{htmlelement("a")}}, thuộc tính `src` có thể là URL tương đối hoặc URL tuyệt đối. Không có thuộc tính `src`, phần tử `img` không có hình ảnh để tải.

[Thuộc tính `alt` được mô tả bên dưới](#alternative_text).

> [!NOTE]
> Bạn nên đọc [Giới thiệu nhanh về URL và đường dẫn](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links#a_quick_primer_on_urls_and_paths) để làm mới bộ nhớ về URL tương đối và tuyệt đối trước khi tiếp tục.

Vì vậy, ví dụ, nếu hình ảnh của bạn được gọi là `dinosaur.jpg` và nằm trong cùng thư mục với trang HTML của bạn, bạn có thể nhúng hình ảnh như sau:

```html
<img src="dinosaur.jpg" alt="Dinosaur" />
```

Nếu hình ảnh nằm trong thư mục con `images`, nằm trong cùng thư mục với trang HTML, thì bạn sẽ nhúng nó như thế này:

```html
<img src="images/dinosaur.jpg" alt="Dinosaur" />
```

Và vân vân.

> [!NOTE]
> Các công cụ tìm kiếm cũng đọc tên tệp hình ảnh và tính vào SEO. Do đó, bạn nên đặt cho hình ảnh của mình một tên tệp mô tả; `dinosaur.jpg` tốt hơn `img835.png`.

Bạn cũng có thể nhúng hình ảnh bằng URL tuyệt đối, ví dụ:

```html
<img src="https://www.example.com/images/dinosaur.jpg" alt="Dinosaur" />
```

Tuy nhiên, không nên liên kết qua URL tuyệt đối. Bạn nên lưu trữ các hình ảnh bạn muốn sử dụng trên trang của mình, điều này trong các thiết lập đơn giản có nghĩa là giữ các hình ảnh cho trang web của bạn trên cùng máy chủ với HTML của bạn. Ngoài ra, việc sử dụng URL tương đối hiệu quả hơn URL tuyệt đối về mặt bảo trì (khi bạn chuyển trang web sang miền khác, bạn sẽ không cần phải cập nhật tất cả URL để bao gồm miền mới). Trong các thiết lập nâng cao hơn, bạn có thể sử dụng [CDN (Content Delivery Network)](/en-US/docs/Glossary/CDN) để phân phối hình ảnh của mình.

Nếu bạn không tạo ra hình ảnh, bạn nên đảm bảo rằng bạn có quyền sử dụng chúng theo các điều kiện của giấy phép mà chúng được xuất bản (xem [Tài sản phương tiện và cấp phép](#media_assets_and_licensing) bên dưới để biết thêm thông tin).

> [!WARNING]
> _Đừng bao giờ_ trỏ thuộc tính `src` đến hình ảnh được lưu trữ trên trang web của người khác _mà không có sự cho phép_. Điều này được gọi là "hotlinking". Nó được coi là phi đạo đức, vì người khác sẽ phải trả chi phí băng thông để phân phối hình ảnh khi ai đó truy cập trang của bạn. Nó cũng khiến bạn không kiểm soát được hình ảnh bị xóa hoặc thay thế bằng thứ gì đó đáng xấu hổ.

Đoạn mã trước đó, dù với URL tuyệt đối hay tương đối, sẽ cho chúng ta kết quả sau:

![Một hình ảnh cơ bản của khủng long, được nhúng trong trình duyệt, với "Images in HTML" được viết phía trên](basic-image.png)

> [!NOTE]
> Các phần tử như {{htmlelement("img")}} và {{htmlelement("video")}} đôi khi được gọi là **replaced elements** (phần tử được thay thế). Điều này là vì nội dung và kích thước của phần tử được xác định bởi tài nguyên bên ngoài (như tệp hình ảnh hoặc video), không phải bởi nội dung của phần tử. Bạn có thể đọc thêm về chúng tại {{ glossary("replaced elements")}}.

> [!NOTE]
> Bạn có thể tìm thấy ví dụ hoàn chỉnh từ phần này [chạy trên GitHub](https://mdn.github.io/learning-area/html/multimedia-and-embedding/images-in-html/index.html) (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/images-in-html/index.html) cũng vậy.)

### Văn bản thay thế

Thuộc tính tiếp theo chúng ta sẽ xem xét là `alt`. Giá trị của nó được cho là mô tả văn bản của hình ảnh, để sử dụng trong các tình huống khi không thể nhìn thấy/hiển thị hình ảnh hoặc mất nhiều thời gian để hiển thị vì kết nối internet chậm. Ví dụ, mã trên của chúng ta có thể được sửa đổi như sau:

```html
<img
  src="images/dinosaur.jpg"
  alt="The head and torso of a dinosaur skeleton;
          it has a large head with long sharp teeth" />
```

Cách dễ nhất để kiểm tra văn bản `alt` của bạn là cố ý viết sai tên tệp. Ví dụ, nếu tên hình ảnh của chúng ta được đánh vần là `dinosooooor.jpg`, trình duyệt sẽ không hiển thị hình ảnh và sẽ hiển thị văn bản alt thay thế:

![Tiêu đề Images in HTML, nhưng lần này hình ảnh khủng long không được hiển thị, và văn bản alt ở vị trí của nó.](alt-text.png)

Vậy, tại sao bạn sẽ thấy hoặc cần văn bản alt? Nó có thể hữu ích vì một số lý do:

- Người dùng bị khiếm thị và đang sử dụng [trình đọc màn hình](https://en.wikipedia.org/wiki/Screen_reader) để đọc web cho họ. Thực ra, việc có văn bản alt để mô tả hình ảnh hữu ích cho hầu hết người dùng.
- Như đã mô tả ở trên, chính tả của tên tệp hoặc đường dẫn có thể sai.
- Trình duyệt không hỗ trợ loại hình ảnh. Một số người vẫn sử dụng trình duyệt chỉ văn bản, như [Lynx](https://en.wikipedia.org/wiki/Lynx_%28web_browser%29), hiển thị văn bản alt của hình ảnh.
- Bạn có thể muốn cung cấp văn bản cho các công cụ tìm kiếm sử dụng; ví dụ, các công cụ tìm kiếm có thể khớp văn bản alt với các truy vấn tìm kiếm.
- Người dùng đã tắt hình ảnh để giảm lưu lượng dữ liệu và sự xao lãng. Điều này đặc biệt phổ biến trên điện thoại di động, và ở các quốc gia có băng thông hạn chế hoặc đắt tiền.

Chính xác bạn nên viết gì bên trong thuộc tính `alt` của mình? Điều đó phụ thuộc vào _lý do_ hình ảnh ở đó ngay từ đầu. Nói cách khác, những gì bạn mất nếu hình ảnh không hiển thị:

- **Trang trí.** Bạn nên sử dụng [CSS background images](#css_background_images) cho hình ảnh trang trí, nhưng nếu bạn phải sử dụng HTML, hãy thêm `alt=""` trống. Nếu hình ảnh không phải là một phần của nội dung, trình đọc màn hình không nên lãng phí thời gian đọc nó.
- **Nội dung.** Nếu hình ảnh cung cấp thông tin quan trọng, hãy cung cấp cùng một thông tin trong văn bản `alt` _ngắn gọn_ — hoặc tốt hơn, trong văn bản chính mà mọi người đều có thể thấy. Đừng viết văn bản `alt` dư thừa. Sẽ khó chịu như thế nào cho người dùng nhìn thấy nếu tất cả các đoạn văn được viết hai lần trong nội dung chính? Nếu hình ảnh được mô tả đầy đủ bởi phần thân văn bản chính, bạn có thể chỉ sử dụng `alt=""`.
- **Liên kết.** Nếu bạn đặt hình ảnh bên trong thẻ {{htmlelement("a")}}, để biến hình ảnh thành liên kết, bạn vẫn phải cung cấp [văn bản liên kết có thể tiếp cận](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links#use_clear_link_wording). Trong những trường hợp như vậy, bạn có thể, hoặc là viết nó bên trong cùng phần tử `<a>`, hoặc bên trong thuộc tính `alt` của hình ảnh — tùy theo cái nào phù hợp nhất trong trường hợp của bạn.
- **Văn bản.** Bạn không nên đặt văn bản vào hình ảnh. Ví dụ, nếu tiêu đề chính của bạn cần bóng đổ, hãy [sử dụng CSS](/en-US/docs/Web/CSS/Reference/Properties/text-shadow) cho điều đó thay vì đặt văn bản vào hình ảnh. Tuy nhiên, nếu bạn _thực sự không thể tránh làm điều này_, bạn nên cung cấp văn bản bên trong thuộc tính `alt`.

Về cơ bản, chìa khóa là mang lại trải nghiệm có thể sử dụng được, ngay cả khi hình ảnh không thể nhìn thấy. Điều này đảm bảo tất cả người dùng không bỏ lỡ bất kỳ nội dung nào. Hãy thử tắt hình ảnh trong trình duyệt của bạn và xem mọi thứ trông như thế nào. Bạn sẽ sớm nhận ra văn bản alt hữu ích như thế nào nếu hình ảnh không thể nhìn thấy.

> [!NOTE]
> Xem hướng dẫn [Các phương án thay thế văn bản](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives) và [Cây quyết định alt](https://www.w3.org/WAI/tutorials/images/decision-tree/) để tìm hiểu cách sử dụng thuộc tính `alt` cho hình ảnh trong các tình huống khác nhau.

> [!NOTE]
> [HTML tags](https://scrimba.com/html-css-crash-course-c02l/~0d?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> từ Scrimba là bài học tương tác cung cấp thông tin về hình ảnh và các thử thách nhỏ.

### Chiều rộng và chiều cao

Bạn có thể sử dụng thuộc tính [`width`](/en-US/docs/Web/HTML/Reference/Elements/img#width) và [`height`](/en-US/docs/Web/HTML/Reference/Elements/img#height) để chỉ định chiều rộng và chiều cao của hình ảnh. Chúng được cung cấp dưới dạng số nguyên không có đơn vị, và biểu diễn chiều rộng và chiều cao của hình ảnh tính theo pixel.

Bạn có thể tìm thấy chiều rộng và chiều cao của hình ảnh theo một số cách. Ví dụ, trên Mac bạn có thể sử dụng <kbd>Cmd</kbd> + <kbd>I</kbd> để lấy thông tin hiển thị cho tệp hình ảnh. Quay lại ví dụ của chúng ta, chúng ta có thể làm điều này:

```html
<img
  src="images/dinosaur.jpg"
  alt="The head and torso of a dinosaur skeleton;
          it has a large head with long sharp teeth"
  width="400"
  height="341" />
```

Có một lý do rất tốt để làm điều này. HTML cho trang của bạn và hình ảnh là các tài nguyên riêng biệt, được tải bởi trình duyệt dưới dạng các yêu cầu HTTP(S) riêng biệt. Ngay khi trình duyệt nhận được HTML, nó sẽ bắt đầu hiển thị nó cho người dùng. Nếu hình ảnh chưa được nhận (và điều này thường là trường hợp, vì kích thước tệp hình ảnh thường lớn hơn nhiều so với tệp HTML), thì trình duyệt sẽ chỉ hiển thị HTML và sẽ cập nhật trang với hình ảnh ngay khi nó được nhận.

Ví dụ, giả sử chúng ta có một số văn bản sau hình ảnh:

```html
<h1>Images in HTML</h1>

<img
  src="dinosaur.jpg"
  alt="The head and torso of a dinosaur skeleton; it has a large head with long sharp teeth"
  title="A T-Rex on display in the Manchester University Museum" />
<blockquote>
  <p>
    But down there it would be dark now, and not the lovely lighted aquarium she
    imagined it to be during the daylight hours, eddying with schools of tiny,
    delicate animals floating and dancing slowly to their own serene currents
    and creating the look of a living painting. That was wrong, in any case. The
    ocean was different from an aquarium, which was an artificial environment.
    The ocean was a world. And a world is not art. Dorothy thought about the
    living things that moved in that world: large, ruthless and hungry. Like us
    up here.
  </p>
  <footer>- Rachel Ingalls, <cite>Mrs. Caliban</cite></footer>
</blockquote>
```

Ngay khi trình duyệt tải xuống HTML, trình duyệt sẽ bắt đầu hiển thị trang.

Khi hình ảnh được tải, trình duyệt thêm hình ảnh vào trang. Vì hình ảnh chiếm không gian, trình duyệt phải di chuyển văn bản xuống trang để phù hợp với hình ảnh phía trên nó:

![So sánh bố cục trang trong khi trình duyệt đang tải trang và khi đã hoàn thành, khi không có kích thước nào được chỉ định cho hình ảnh.](no-size.png)

Di chuyển văn bản như thế này cực kỳ gây mất tập trung cho người dùng, đặc biệt nếu họ đã bắt đầu đọc nó, và nó cũng khiến trình duyệt phải hiển thị lại trang, điều này xấu cho hiệu suất.

Nếu bạn chỉ định kích thước thực tế của hình ảnh trong HTML bằng cách sử dụng thuộc tính `width` và `height`, thì trình duyệt biết bao nhiêu không gian cần dành cho hình ảnh, trước khi nó tải xuống.

Điều này có nghĩa là khi hình ảnh đã được tải xuống, trình duyệt không phải di chuyển nội dung xung quanh.

![So sánh bố cục trang trong khi trình duyệt đang tải trang và khi đã hoàn thành, khi kích thước hình ảnh được chỉ định.](size.png)

Để biết bài viết xuất sắc về lịch sử của tính năng này, hãy xem [Setting height and width on images is important again](https://www.smashingmagazine.com/2020/03/setting-height-width-images-important-again/).

Lưu ý rằng nếu không có nội dung bên dưới hình ảnh, việc hiển thị lại không phải là vấn đề vì việc thay đổi kích thước hình ảnh sẽ không khiến các phần tử khác dịch chuyển. Trong trường hợp đó, bạn có thể chỉ đặt `width` của hình ảnh. Nếu bạn đặt `width` nhưng không đặt `height`, `height` mặc định là `auto` có nghĩa là nó được đặt thành một giá trị duy trì [tỷ lệ khung hình](/en-US/docs/Glossary/Aspect_ratio) của hình ảnh.

#### Thay đổi kích thước hình ảnh

Mặc dù, như chúng tôi đã nói, thực hành tốt là chỉ định kích thước _thực tế_ của hình ảnh bằng thuộc tính HTML, bạn không nên sử dụng chúng để _thay đổi kích thước_ hình ảnh.

Nếu bạn đặt kích thước hình ảnh quá lớn, bạn sẽ kết thúc với các hình ảnh trông hạt, mờ hoặc quá nhỏ, và lãng phí băng thông để tải xuống hình ảnh không phù hợp với nhu cầu của người dùng. Hình ảnh cũng có thể bị méo, nếu bạn không duy trì {{glossary("aspect ratio")}} đúng. Bạn nên sử dụng trình chỉnh sửa hình ảnh để đặt hình ảnh ở kích thước đúng trước khi đặt nó lên trang web của bạn.

Nếu bạn cần thay đổi kích thước hình ảnh, bạn nên sử dụng [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics) thay thế.

### Tiêu đề hình ảnh

Như [với các liên kết](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links#adding_supporting_information_with_the_title_attribute), bạn cũng có thể thêm thuộc tính `title` vào hình ảnh, để cung cấp thông tin hỗ trợ thêm nếu cần. Trong ví dụ của chúng ta, chúng ta có thể làm điều này:

```html
<img
  src="images/dinosaur.jpg"
  alt="The head and torso of a dinosaur skeleton;
          it has a large head with long sharp teeth"
  width="400"
  height="341"
  title="A T-Rex on display in the Manchester University Museum" />
```

Điều này cho chúng ta tooltip khi di chuột qua, giống như tiêu đề liên kết:

![Hình ảnh khủng long, với tooltip tiêu đề phía trên nó có nội dung A T-Rex on display at the Manchester University Museum](image-with-title.png)

Tuy nhiên, điều này không được khuyến nghị — `title` có một số vấn đề về khả năng tiếp cận, chủ yếu dựa trên thực tế là hỗ trợ trình đọc màn hình rất không thể đoán trước và hầu hết các trình duyệt sẽ không hiển thị nó trừ khi bạn đang di chuột qua bằng chuột (vì vậy ví dụ không có quyền truy cập cho người dùng bàn phím). Nếu bạn quan tâm đến thông tin thêm về điều này, hãy đọc [The Trials and Tribulations of the Title Attribute](https://www.24a11y.com/2017/the-trials-and-tribulations-of-the-title-attribute/) của Scott O'Hara.

Tốt hơn là bao gồm thông tin hỗ trợ đó trong văn bản bài viết chính, thay vì đính kèm vào hình ảnh.

### Thực hành nhúng hình ảnh

Bây giờ đến lượt bạn thực hành! Nhiệm vụ này sẽ yêu cầu bạn nhúng hình ảnh.

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Chỉnh sửa thẻ {{htmlelement("img")}} hiện có để nhúng hình ảnh nằm tại URL sau:

   ```url
   https://raw.githubusercontent.com/mdn/learning-area/master/html/multimedia-and-embedding/images-in-html/dinosaur_small.jpg
   ```

   > [!NOTE]
   > Trước đó chúng tôi đã nói không bao giờ hotlink đến hình ảnh trên máy chủ của người khác mà không có sự cho phép, nhưng hình ảnh này nằm trên kho GitHub của chúng tôi, vì vậy nó được chấp nhận.

3. Thêm thuộc tính `alt` vào hình ảnh. Bạn có thể kiểm tra rằng văn bản alt hoạt động bằng cách tạm thời viết sai URL hình ảnh.
4. Đặt `width` và `height` đúng của hình ảnh (gợi ý: nó rộng `200px` và cao `171px`), sau đó thử nghiệm với các giá trị khác để xem hiệu ứng là gì.
5. Đặt `title` trên hình ảnh.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html live-sample___images-1
<img />
```

{{ EmbedLiveSample('images-1', "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<img
  src="https://raw.githubusercontent.com/mdn/learning-area/master/html/multimedia-and-embedding/images-in-html/dinosaur_small.jpg"
  alt="The head and torso of a dinosaur skeleton; it has a large head with long sharp teeth"
  width="200"
  height="171"
  title="A T-Rex on display in the Manchester University Museum" />
```

</details>

## Tài sản phương tiện và cấp phép

Hình ảnh (và các loại tài sản phương tiện khác) bạn tìm thấy trên web được phát hành theo các loại giấy phép khác nhau. Trước khi bạn sử dụng hình ảnh trên trang web bạn đang xây dựng, hãy đảm bảo bạn sở hữu nó, có sự cho phép để sử dụng nó, hoặc tuân thủ các điều kiện cấp phép của chủ sở hữu.

### Hiểu các loại giấy phép

Hãy xem một số danh mục giấy phép phổ biến bạn có thể tìm thấy trên web.

#### Tất cả các quyền được bảo lưu

Những người sáng tạo tác phẩm gốc như bài hát, sách hoặc phần mềm thường phát hành tác phẩm của họ theo bảo vệ bản quyền kín. Điều này có nghĩa là, theo mặc định, họ (hoặc nhà xuất bản của họ) có quyền độc quyền để sử dụng (ví dụ: hiển thị hoặc phân phối) tác phẩm của họ. Nếu bạn muốn sử dụng hình ảnh có bản quyền với giấy phép _tất cả các quyền được bảo lưu_, bạn cần thực hiện một trong những điều sau:

- Nhận sự cho phép rõ ràng, bằng văn bản từ chủ sở hữu bản quyền.
- Trả phí cấp phép để sử dụng chúng. Đây có thể là phí một lần cho việc sử dụng không giới hạn ("royalty-free"), hoặc nó có thể là "rights-managed", trong trường hợp đó bạn có thể phải trả các khoản phí cụ thể theo từng lần sử dụng theo khe thời gian, khu vực địa lý, ngành hoặc loại phương tiện, v.v.
- Hạn chế việc sử dụng của bạn đối với những gì được coi là [fair use](https://fairuse.stanford.edu/overview/fair-use/what-is-fair-use/) hoặc [fair dealing](https://copyrightservice.co.uk/copyright/p27_work_of_others) trong thẩm quyền của bạn.

Các tác giả không bắt buộc phải đưa thông báo bản quyền hoặc điều khoản giấy phép vào tác phẩm của họ. Bản quyền tồn tại tự động trong tác phẩm gốc của quyền tác giả một khi nó được tạo ra trong phương tiện hữu hình. Vì vậy, nếu bạn tìm thấy hình ảnh trực tuyến và không có thông báo bản quyền hoặc điều khoản giấy phép, cách an toàn nhất là giả định nó được bảo vệ bởi bản quyền với tất cả các quyền được bảo lưu.

#### Cho phép

Nếu hình ảnh được phát hành theo giấy phép cho phép, chẳng hạn như [MIT](https://mit-license.org/), [BSD](https://opensource.org/license/BSD-3-clause), hoặc [giấy phép Creative Commons (CC)](https://creativecommons.org/chooser/) phù hợp, bạn không cần phải trả phí cấp phép hoặc tìm kiếm sự cho phép để sử dụng nó. Tuy nhiên, có các điều kiện cấp phép khác nhau mà bạn sẽ phải thực hiện, tùy theo giấy phép.

Ví dụ, bạn có thể phải:

- Cung cấp liên kết đến nguồn gốc của hình ảnh và ghi công người tạo ra nó.
- Cho biết liệu có thay đổi nào được thực hiện với nó hay không.
- Chia sẻ bất kỳ tác phẩm dẫn xuất nào được tạo bằng hình ảnh theo cùng giấy phép với bản gốc.
- Không chia sẻ bất kỳ tác phẩm dẫn xuất nào.
- Không sử dụng hình ảnh trong bất kỳ công việc thương mại nào.
- Bao gồm bản sao của giấy phép cùng với bất kỳ phát hành nào sử dụng hình ảnh.

Bạn nên tham khảo giấy phép có thể áp dụng cho các điều khoản cụ thể bạn cần tuân theo.

> [!NOTE]
> Bạn có thể gặp thuật ngữ "copyleft" trong bối cảnh giấy phép cho phép. Giấy phép copyleft (như [GNU General Public License (GPL)](https://www.gnu.org/licenses/gpl-3.0.en.html) hoặc giấy phép Creative Commons "Share Alike") quy định rằng các tác phẩm dẫn xuất cần được phát hành theo cùng giấy phép với bản gốc.

Giấy phép copyleft nổi bật trong thế giới phần mềm. Ý tưởng cơ bản là dự án mới được xây dựng với mã của dự án được cấp phép copyleft (điều này được gọi là "fork" của phần mềm gốc) cũng sẽ cần được cấp phép theo cùng giấy phép copyleft. Điều này đảm bảo rằng mã nguồn của dự án mới cũng sẽ được làm sẵn cho người khác để nghiên cứu và sửa đổi. Lưu ý rằng, nói chung, các giấy phép được soạn thảo cho phần mềm, như GPL, không được coi là giấy phép tốt cho các tác phẩm phi phần mềm vì chúng không được soạn thảo với các tác phẩm phi phần mềm trong tâm trí.

Khám phá các liên kết được cung cấp trước đó trong phần này để đọc về các loại giấy phép khác nhau và các loại điều kiện chúng chỉ định.

#### Tên miền công cộng/CC0

Tác phẩm được phát hành vào tên miền công cộng đôi khi được gọi là "không có quyền nào được bảo lưu" — không có bản quyền nào áp dụng cho nó, và nó có thể được sử dụng mà không cần sự cho phép và không cần thực hiện bất kỳ điều kiện cấp phép nào. Tác phẩm có thể kết thúc trong tên miền công cộng theo nhiều cách như hết hạn bản quyền, hoặc sự từ bỏ quyền cụ thể.

Một trong những cách hiệu quả nhất để đặt tác phẩm vào tên miền công cộng là cấp phép nó theo [CC0](https://creativecommons.org/public-domain/cc0/), một giấy phép creative commons cụ thể cung cấp một công cụ pháp lý rõ ràng và không mơ hồ cho mục đích này.

Khi sử dụng hình ảnh thuộc tên miền công cộng, hãy lấy bằng chứng rằng hình ảnh thuộc tên miền công cộng và giữ bằng chứng cho hồ sơ của bạn. Ví dụ, chụp ảnh màn hình nguồn gốc với trạng thái cấp phép được hiển thị rõ ràng, và cân nhắc thêm trang vào trang web của bạn với danh sách các hình ảnh được lấy cùng với yêu cầu giấy phép của chúng.

### Tìm kiếm hình ảnh được cấp phép cho phép

Bạn có thể tìm thấy hình ảnh được cấp phép cho phép cho các dự án của mình bằng công cụ tìm kiếm hình ảnh hoặc trực tiếp từ các kho hình ảnh.

Tìm kiếm hình ảnh bằng mô tả về hình ảnh bạn đang tìm kiếm cùng với các điều khoản cấp phép liên quan. Ví dụ, khi tìm kiếm "yellow dinosaur", hãy thêm "public domain images", "public domain image library", "open licensed images", hoặc các thuật ngữ tương tự vào truy vấn tìm kiếm.

Một số công cụ tìm kiếm có công cụ để giúp bạn tìm hình ảnh với giấy phép cho phép. Ví dụ, khi sử dụng Google, hãy đến tab "Images" để tìm kiếm hình ảnh, sau đó nhấp "Tools". Có dropdown "Usage Rights" trong thanh công cụ kết quả nơi bạn có thể chọn tìm kiếm cụ thể cho hình ảnh theo giấy phép creative commons.

Các trang kho hình ảnh, chẳng hạn như [Flickr](https://flickr.com/), [ShutterStock](https://www.shutterstock.com/) và [Pixabay](https://pixabay.com/), có tùy chọn tìm kiếm để cho phép bạn chỉ tìm kiếm hình ảnh được cấp phép cho phép. Một số trang chỉ phân phối hình ảnh và biểu tượng được cấp phép cho phép, chẳng hạn như [Picryl](https://picryl.com/) và [The Noun Project](https://thenounproject.com/).

Tuân thủ giấy phép mà hình ảnh đã được phát hành là vấn đề tìm thông tin giấy phép, đọc trang giấy phép hoặc hướng dẫn được cung cấp bởi nguồn, và sau đó làm theo các hướng dẫn đó. Các kho hình ảnh uy tín làm cho các điều kiện giấy phép của họ rõ ràng và dễ tìm.

## Chú thích hình ảnh với figures và figure captions

Nói về phụ đề, có một số cách bạn có thể thêm phụ đề để đi cùng với hình ảnh của bạn. Ví dụ, sẽ không có gì ngăn bạn làm điều này:

```html
<div class="figure">
  <img
    src="images/dinosaur.jpg"
    alt="The head and torso of a dinosaur skeleton;
            it has a large head with long sharp teeth"
    width="400"
    height="341" />

  <p>A T-Rex on display in the Manchester University Museum.</p>
</div>
```

Điều này ổn. Nó chứa nội dung bạn cần, và có thể tạo kiểu đẹp bằng CSS. Nhưng có một vấn đề ở đây: không có gì liên kết ngữ nghĩa hình ảnh với phụ đề của nó, điều này có thể gây ra vấn đề cho các trình đọc màn hình. Ví dụ, khi bạn có 50 hình ảnh và phụ đề, phụ đề nào đi với hình ảnh nào?

Giải pháp tốt hơn là sử dụng các phần tử HTML {{htmlelement("figure")}} và {{htmlelement("figcaption")}}. Chúng được tạo ra chính xác cho mục đích này: để cung cấp vùng chứa ngữ nghĩa cho các hình ảnh và để liên kết rõ ràng hình ảnh với phụ đề. Ví dụ trên của chúng ta có thể được viết lại như thế này:

```html
<figure>
  <img
    src="images/dinosaur.jpg"
    alt="The head and torso of a dinosaur skeleton;
            it has a large head with long sharp teeth"
    width="400"
    height="341" />

  <figcaption>
    A T-Rex on display in the Manchester University Museum.
  </figcaption>
</figure>
```

Phần tử {{htmlelement("figcaption")}} cho trình duyệt và công nghệ hỗ trợ biết rằng phụ đề mô tả nội dung khác của phần tử {{htmlelement("figure")}}.

> [!NOTE]
> Từ góc độ khả năng tiếp cận, phụ đề và văn bản [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt) có vai trò riêng biệt. Phụ đề mang lại lợi ích ngay cả cho những người có thể nhìn thấy hình ảnh, trong khi văn bản [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt) cung cấp cùng chức năng với hình ảnh vắng mặt. Do đó, phụ đề và văn bản `alt` không nên chỉ nói điều tương tự, vì cả hai đều xuất hiện khi hình ảnh biến mất. Hãy thử tắt hình ảnh trong trình duyệt của bạn và xem nó trông như thế nào.

Hình ảnh không nhất thiết phải là hình ảnh. Đây là một đơn vị nội dung độc lập:

- Thể hiện ý nghĩa của bạn theo cách nhỏ gọn, dễ nắm bắt.
- Có thể ở nhiều nơi trong dòng chảy tuyến tính của trang.
- Cung cấp thông tin thiết yếu hỗ trợ văn bản chính.

Hình ảnh có thể là nhiều hình ảnh, đoạn mã, âm thanh, video, phương trình, bảng, hoặc thứ gì đó khác.

### Tạo hình ảnh

Trong nhiệm vụ này, chúng tôi muốn bạn lấy mã hoàn chỉnh từ nhiệm vụ trước làm điểm bắt đầu và biến nó thành hình ảnh:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Bao bọc phần tử `<img>` trong phần tử {{htmlelement("figure")}}.
3. Sao chép văn bản ra khỏi thuộc tính `title`, đặt nó bên trong phần tử {{htmlelement("figcaption")}} bên dưới phần tử `<img>`, sau đó xóa thuộc tính `title`.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html live-sample___images-2
<img
  src="https://raw.githubusercontent.com/mdn/learning-area/master/html/multimedia-and-embedding/images-in-html/dinosaur_small.jpg"
  alt="The head and torso of a dinosaur skeleton; it has a large head with long sharp teeth"
  width="200"
  height="171"
  title="A T-Rex on display in the Manchester University Museum" />
```

{{ EmbedLiveSample('images-2', "100%", 200) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<figure>
  <img
    src="https://raw.githubusercontent.com/mdn/learning-area/master/html/multimedia-and-embedding/images-in-html/dinosaur_small.jpg"
    alt="The head and torso of a dinosaur skeleton; it has a large head with long sharp teeth"
    width="200"
    height="171" />
  <figcaption>
    A T-Rex on display in the Manchester University Museum
  </figcaption>
</figure>
```

</details>

## CSS background images

Bạn cũng có thể sử dụng CSS để nhúng hình ảnh vào các trang web (và JavaScript, nhưng đó là câu chuyện hoàn toàn khác). Thuộc tính CSS {{cssxref("background-image")}} và các thuộc tính `background-*` khác được sử dụng để kiểm soát vị trí đặt hình nền. Ví dụ, để đặt hình nền trên mọi đoạn văn trên trang, bạn có thể làm điều này:

```css
p {
  background-image: url("images/dinosaur.jpg");
}
```

Hình ảnh được nhúng kết quả có thể nói là dễ định vị và kiểm soát hơn so với hình ảnh HTML. Vậy tại sao lại bận tâm với hình ảnh HTML? Như đã gợi ý ở trên, CSS background images chỉ để trang trí. Nếu bạn chỉ muốn thêm thứ gì đó đẹp vào trang để tăng cường hình ảnh, điều này ổn. Tuy nhiên, những hình ảnh như vậy không có ý nghĩa ngữ nghĩa nào. Chúng không thể có bất kỳ tương đương văn bản nào, vô hình với trình đọc màn hình, v.v. Đây là nơi hình ảnh HTML tỏa sáng!

Tóm lại: nếu hình ảnh có ý nghĩa, về mặt nội dung của bạn, bạn nên sử dụng hình ảnh HTML. Nếu hình ảnh chỉ là trang trí, bạn nên sử dụng CSS background images (chúng tôi sẽ đề cập chi tiết về chúng sau trong các mô-đun Core).

## Tóm tắt

Đó là tất cả bây giờ. Chúng tôi đã đề cập chi tiết về hình ảnh và phụ đề.

Trong bài viết tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn hiểu và ghi nhớ thông tin chúng tôi đã cung cấp về hình ảnh HTML.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Structuring_a_page_of_content", "Learn_web_development/Core/Structuring_content/Test_your_skills/Images", "Learn_web_development/Core/Structuring_content")}}
