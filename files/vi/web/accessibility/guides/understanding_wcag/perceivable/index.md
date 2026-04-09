---
title: Có thể nhận biết
slug: Web/Accessibility/Guides/Understanding_WCAG/Perceivable
page-type: guide
sidebar: accessibilitysidebar
---

Bài viết này cung cấp lời khuyên thực tế về cách viết nội dung web sao cho phù hợp với các tiêu chí thành công được nêu trong nguyên tắc **Có thể nhận biết** của Web Content Accessibility Guidelines (WCAG) 2.0 và 2.1. Có thể nhận biết có nghĩa là người dùng phải có thể nhận biết nội dung theo một cách nào đó, bằng một hoặc nhiều giác quan của họ.

> [!NOTE]
> Để đọc các định nghĩa của W3C về Có thể nhận biết và các hướng dẫn cũng như tiêu chí thành công của nó, xem [Nguyên tắc 1: Có thể nhận biết - Thông tin và các thành phần giao diện người dùng phải có thể trình bày cho người dùng theo những cách họ có thể nhận biết.](https://w3c.github.io/wcag/guidelines/22/#perceivable)

## Hướng dẫn 1.1 - Cung cấp văn bản thay thế cho nội dung không phải văn bản

Điểm mấu chốt ở đây là văn bản có thể được chuyển sang các dạng khác mà người khuyết tật có thể dùng. Ví dụ, nó có thể được trình đọc màn hình đọc thành tiếng, chuyển sang bản in lớn, hoặc hiển thị trên màn hình chữ nổi Braille. Nội dung không phải văn bản đề cập đến các phương tiện đa phương tiện như hình ảnh, âm thanh, và video.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Tiêu chí thành công</th>
      <th scope="col">Cách đáp ứng tiêu chí</th>
      <th scope="col">Tài nguyên thực hành</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="5">1.1.1 Cung cấp tương đương văn bản (A)</td>
      <td>
        Tất cả hình ảnh truyền tải nội dung có ý nghĩa nên được cung cấp văn
        bản thay thế phù hợp.
      </td>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives"
          >Văn bản thay thế.</a
        >
      </td>
    </tr>
    <tr>
      <td>
        Hình ảnh hoặc biểu đồ phức tạp nên có một phương án thay thế có thể
        truy cập, либо ngay trên cùng trang hoặc thông qua một liên kết. Hãy
        dùng liên kết thông thường thay vì thuộc tính <code>longdesc</code>.
      </td>
      <td>
        <p>
          Mô tả văn bản có thể phù hợp, hoặc một bảng dữ liệu có thể truy cập
          (xem <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Table_accessibility"
            >khả năng truy cập bảng HTML</a
          >). Xem
          <a href="https://www.w3.org/TR/html-longdesc/">Image Description Extension (longdesc)</a>
          của W3C để biết lập luận phản đối <code>longdesc</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        Nội dung đa phương tiện (tức âm thanh hoặc video) ít nhất nên có một
        dạng nhận diện mô tả sẵn, chẳng hạn chú thích hoặc tương tự.
      </td>
      <td>
        <p>
          Xem <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives"
            >Văn bản thay thế</a
          >
          cho các tùy chọn chú thích tĩnh, và
          <a href="/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#audio_transcripts"
            >Bản ghi âm thanh</a
          >,
          <a href="/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#video_text_tracks"
            >Các bản văn bản của video</a
          >
          cho các phương án thay thế khác.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        Các điều khiển giao diện như phần tử biểu mẫu và nút nên có nhãn văn
        bản mô tả mục đích của chúng.
      </td>
      <td>
        Nút thì đơn giản - bạn nên bảo đảm văn bản của nút mô tả chức năng của
        nút (ví dụ, <code
          >&#x3C;button>Tải ảnh lên&#x3C;/button></code
        >). Để biết thêm thông tin về các điều khiển giao diện khác, xem
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_semantic_ui_controls_where_possible"
          >Hãy dùng điều khiển giao diện ngữ nghĩa khi có thể</a
        >.
      </td>
    </tr>
    <tr>
      <td>
        Triển khai các hình ảnh, video, v.v. mang tính trang trí (không phải
        nội dung) theo cách vô hình với công nghệ hỗ trợ, để nó không làm người
        dùng bối rối.
      </td>
      <td>
        <p>
          Hình ảnh trang trí nên được triển khai bằng ảnh nền CSS (xem
          <a
            href="/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders"
            >Nền và đường viền</a
          >). Nếu bạn buộc phải chèn hình ảnh bằng phần tử
          {{htmlelement("img")}}, hãy cho nó alt trống
          (<code>alt=""</code>). Nếu không, trình đọc màn hình có thể cố đọc ra
          đường dẫn tệp, v.v.
        </p>
        <p>
          Nếu bạn đưa video hoặc âm thanh nền tự phát, hãy làm nó càng ít gây
          chú ý càng tốt. Đừng để nó trông/nghe như nội dung, và hãy cung cấp
          một điều khiển để tắt nó đi. Tốt nhất là đừng đưa nó vào.
        </p>
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem [mô tả WCAG cho Hướng dẫn 1.1: Văn bản thay thế](https://w3c.github.io/wcag/guidelines/22/#text-alternatives).

## Hướng dẫn 1.2 - Cung cấp văn bản thay thế cho phương tiện có thời lượng

Phương tiện có thời lượng đề cập đến nội dung đa phương tiện có độ dài, chẳng hạn âm thanh và video. Lưu ý rằng nếu audio/video đóng vai trò như một phương án thay thế cho nội dung văn bản đã có, bạn không cần cung cấp thêm văn bản thay thế khác.

<table>
  <thead>
    <tr>
       <th scope="col">Tiêu chí thành công</th>
       <th scope="col">Cách đáp ứng tiêu chí</th>
       <th scope="col">Tài nguyên thực hành</th>
    </tr>
  </thead>
  <tbody>
    <tr>
       <td>1.2.1 Cung cấp phương án thay thế cho nội dung chỉ âm thanh và chỉ video đã ghi sẵn (A)</td>
       <td>Cần có bản ghi cho phương tiện chỉ âm thanh đã ghi sẵn, và cần có bản ghi hoặc mô tả âm thanh cho video chỉ hình đã ghi sẵn (tức video không tiếng).</td>
       <td>Xem&nbsp;<a href="/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#audio_transcripts">Bản ghi âm thanh</a> để biết thông tin về bản ghi. Hiện chưa có hướng dẫn nào về mô tả âm thanh.</td>
    </tr>
    <tr>
       <td>1.2.2 Cung cấp phụ đề cho video trên web (A)</td>
       <td>Bạn nên cung cấp phụ đề cho video được trình bày trên web (ví dụ, video HTML). Điều này có lợi cho những người không nghe được phần âm thanh của video.</td>
       <td>Xem <a href="/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#video_text_tracks">Các bản văn bản của video</a> để biết phụ đề cho video HTML. Xem thêm <a href="https://support.google.com/youtube/answer/2734796?hl=en">Thêm phụ đề và chú thích đóng của riêng bạn</a> (YouTube).</td>
    </tr>
    <tr>
       <td>1.2.3 Cung cấp bản ghi văn bản hoặc mô tả âm thanh cho video trên web (A)</td>
       <td>Bạn nên cung cấp bản ghi văn bản hoặc mô tả âm thanh cho video được trình bày trên web (ví dụ, video HTML). Điều này có lợi cho những người không nhìn thấy phần hình ảnh của video và không nhận được đầy đủ nội dung chỉ từ âm thanh.</td>
       <td>Xem&nbsp;<a href="/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#audio_transcripts">Bản ghi âm thanh</a> để biết thông tin về bản ghi. Hiện chưa có hướng dẫn nào về mô tả âm thanh.</td>
    </tr>
    <tr>
       <td>1.2.4 Cung cấp phụ đề cho âm thanh trực tiếp (AA)</td>
       <td>Bạn nên cung cấp phụ đề đồng bộ cho mọi phương tiện trực tiếp có chứa âm thanh (ví dụ, hội nghị video, phát thanh trực tiếp).</td>
       <td></td>
    </tr>
    <tr>
       <td>1.2.5 Cung cấp mô tả âm thanh cho video đã ghi sẵn (AA)</td>
       <td>Nên cung cấp mô tả âm thanh cho video đã ghi sẵn, nhưng chỉ ở nơi âm thanh hiện có không truyền tải đầy đủ ý nghĩa được video thể hiện.</td>
       <td></td>
    </tr>
    <tr>
       <td>1.2.6 Cung cấp ngôn ngữ ký hiệu tương đương với âm thanh đã ghi sẵn (AAA)</td>
       <td>Nên cung cấp một video ngôn ngữ ký hiệu tương đương cho mọi nội dung đã ghi sẵn có chứa âm thanh.</td>
       <td></td>
    </tr>
    <tr>
       <td>1.2.7 Cung cấp video mở rộng kèm mô tả âm thanh (AAA)</td>
       <td>Khi không thể cung cấp mô tả âm thanh (xem 1.2.5) do vấn đề thời lượng video (ví dụ, không có khoảng dừng phù hợp trong nội dung để chèn mô tả âm thanh), nên cung cấp một phiên bản thay thế của video có chèn các khoảng dừng (và mô tả âm thanh).</td>
       <td></td>
    </tr>
    <tr>
       <td>1.2.8 Cung cấp phương án thay thế cho phương tiện đã ghi sẵn (AAA)</td>
       <td>Đối với mọi nội dung có video, nên cung cấp bản ghi văn bản mô tả, ví dụ như kịch bản của bộ phim bạn đang xem. Điều này có lợi cho người khiếm thính không nghe được nội dung.</td>
       <td>Xem&nbsp;<a href="/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#audio_transcripts">Bản ghi âm thanh</a> để biết thông tin về bản ghi.</td>
    </tr>
    <tr>
       <td>1.2.9 Cung cấp bản ghi cho âm thanh trực tiếp (AAA)</td>
       <td>Đối với bất kỳ nội dung âm thanh trực tiếp nào đang được phát, nên cung cấp văn bản mô tả, ví dụ như kịch bản của vở kịch hoặc buổi nhạc bạn đang nghe. Điều này có lợi cho người khiếm thính không nghe được nội dung.</td>
       <td>Xem&nbsp;<a href="/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#audio_transcripts">Bản ghi âm thanh</a> để biết thông tin về bản ghi.</td>
    </tr>
 </tbody>
</table>

> [!NOTE]
> Cũng xem [mô tả WCAG cho Hướng dẫn 1.2: Phương tiện dựa trên thời gian: Cung cấp phương án thay thế cho phương tiện dựa trên thời gian](https://w3c.github.io/wcag/guidelines/22/#time-based-media).

## Hướng dẫn 1.3 - Tạo nội dung có thể được trình bày theo nhiều cách khác nhau

Hướng dẫn này đề cập đến khả năng nội dung có thể được người dùng tiếp nhận theo nhiều cách, phù hợp với các nhu cầu khác nhau của họ.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="col">Tiêu chí thành công</th>
      <th scope="col">Cách đáp ứng tiêu chí</th>
      <th scope="col">Tài nguyên thực hành</th>
    </tr>
    <tr>
      <td>1.3.1 Thông tin và quan hệ (A)</td>
      <td>
        <p>
          Bất kỳ cấu trúc nội dung nào - hoặc quan hệ trực quan được tạo ra giữa
          các nội dung - cũng có thể được xác định bằng lập trình, hoặc được suy
          ra từ mô tả văn bản. Những tình huống chính liên quan là:
        </p>
        <ul>
          <li>
            Nhãn văn bản và các phần tử biểu mẫu mà chúng mô tả. Chúng được liên
            kết một cách rõ ràng bằng phần tử {{htmlelement("label")}},
            phần tử này có thể được trình đọc màn hình, v.v. nhận diện.
          </li>
          <li>
            Văn bản thay thế cho ảnh. Ảnh nội dung nên có sẵn văn bản mô tả rõ
            nội dung của ảnh, có thể được liên kết với ảnh bằng lập trình (ví
            dụ, alt text), hoặc ít nhất là dễ liên kết (ví dụ, mô tả nó và nằm
            ngay cạnh nó). Điều này nên bảo đảm rằng toàn bộ ý nghĩa vẫn có thể
            được suy ra ngay cả khi bạn không nhìn thấy ảnh.
          </li>
          <li>
            Danh sách. Nếu thứ tự các mục trong danh sách là quan trọng, hãy dùng
            danh sách có thứ tự ({{htmlelement("ol")}}).
          </li>
        </ul>
      </td>
      <td>
        Toàn bộ
        <p>
          <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML"
            >HTML: Nền tảng tốt cho khả năng truy cập</a
          >
          chứa rất nhiều thông tin về vấn đề này, nhưng bạn nên đặc biệt tham
          khảo
          <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#good_semantics"
            >Ngữ nghĩa tốt</a
          >,
          <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_semantic_ui_controls_where_possible"
            >Hãy dùng điều khiển giao diện ngữ nghĩa khi có thể</a
          >, và
          <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives"
            >Văn bản thay thế</a
          >.
        </p>
      </td>
    </tr>
    <tr>
      <td>1.3.2 Chuỗi nội dung có ý nghĩa (A)</td>
      <td>
        Trật tự đọc hợp lý, có logic nên dễ xác định đối với mọi nội dung, ngay
        cả khi nó được trình bày trực quan theo cách không bình thường. Trật tự
        đó nên được thể hiện rõ bằng cách dùng các phần tử ngữ nghĩa đúng (ví
        dụ, tiêu đề, đoạn văn), còn CSS được dùng để tạo các kiểu bố cục bất
        thường, bất kể markup.
      </td>
      <td>
        Một lần nữa, hãy tham khảo
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML"
          >HTML: Nền tảng tốt cho khả năng truy cập</a
        >.
      </td>
    </tr>
    <tr>
      <td>1.3.3 Đặc điểm cảm quan (A)</td>
      <td>
        <p>
          Hướng dẫn vận hành điều khiển hoặc hiểu nội dung không được phụ thuộc
          vào một giác quan duy nhất. Điều này có thể làm cho người khuyết tật
          liên quan đến giác quan đó, hoặc thiết bị không hỗ trợ giác quan đó,
          không thể truy cập. Ví dụ:
        </p>
        <ul>
          <li>
            "Nhấn nút tròn để tiếp tục"<br />Nút nên được gắn nhãn rõ ràng để
            hiển nhiên rằng đó là nút bạn cần nhấn. Nếu có nhiều nút, hãy bảo
            đảm tất cả đều được gắn nhãn rõ ràng để phân biệt chức năng của
            chúng.
          </li>
          <li>
            "Nghe các hướng dẫn âm thanh để được hướng dẫn"<br />Điều này rõ
            ràng có vấn đề - âm thanh sẽ không truy cập được với người khiếm
            thính, trong khi văn bản có thể được đọc, nhưng cũng có thể được
            trình đọc màn hình đọc to nếu cần.
          </li>
          <li>
            "Vuốt từ mép phải của màn hình để hiện menu"<br />Một số người dùng
            có thể không thể vuốt màn hình, do khuyết tật hoặc vì thiết bị của
            họ không hỗ trợ chạm. Nên cung cấp phương án thay thế, chẳng hạn
            phím tắt bàn phím hoặc nút có thể được kích hoạt bằng bàn phím hay
            các cách khác.
          </li>
        </ul>
        <div class="note notecard">
          <p>
            <strong>Lưu ý:</strong> Truyền đạt hướng dẫn chỉ bằng màu sắc có
            liên quan, nhưng được bao phủ trong một hướng dẫn khác - 1.4.1.
          </p>
        </div>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        1.3.4 Hướng hiển thị (AA)
      </td>
      <td>
        Nội dung không được giới hạn việc xem và vận hành chỉ ở một hướng hiển
        thị duy nhất, chẳng hạn dọc hoặc ngang, trừ khi một hướng hiển thị cụ
        thể là thiết yếu.
      </td>
      <td>
        <p>
          <a href="https://www.w3.org/WAI/WCAG21/Understanding/orientation.html"
            >Hiểu về Hướng hiển thị</a
          >
        </p>
      </td>
    </tr>
    <tr>
      <td>
        1.3.5 Xác định mục đích đầu vào (AA)
      </td>
      <td>
        <p>
          Làm theo danh sách
          <a href="https://w3c.github.io/wcag/guidelines/22/#input-purposes"
            >53 trường đầu vào</a
          >
          để xác định mục đích của một trường bằng lập trình.
        </p>
      </td>
      <td>
        <a
          href="https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose.html"
          >Hiểu về Xác định Mục đích Đầu vào</a
        >
      </td>
    </tr>
    <tr>
      <td>
        1.3.6 Xác định mục đích (AAA)
      </td>
      <td>
        Trong nội dung được triển khai bằng ngôn ngữ markup, mục đích của các
        thành phần giao diện người dùng, biểu tượng, và vùng có thể được xác
        định bằng lập trình.
      </td>
      <td>
        <a
          href="https://www.w3.org/WAI/WCAG21/Understanding/identify-purpose.html"
          >Hiểu về Xác định Mục đích</a
        >
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem mô tả WCAG cho [Hướng dẫn 1.3: Có thể thích ứng: Tạo nội dung có thể được trình bày theo nhiều cách mà không mất thông tin hoặc cấu trúc.](https://w3c.github.io/wcag/guidelines/22/#adaptable)

## Hướng dẫn 1.4: Làm cho người dùng dễ nhìn và nghe nội dung hơn, bao gồm tách tiền cảnh khỏi nền

Hướng dẫn này liên quan đến việc bảo đảm nội dung cốt lõi dễ phân biệt với nền và các yếu tố trang trí khác. Ví dụ điển hình là màu sắc (cả [tương phản màu](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) và [việc dùng màu](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Use_of_color) để truyền đạt hướng dẫn), nhưng nó cũng áp dụng trong những tình huống khác.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Tiêu chí thành công</th>
      <th scope="col">Cách đáp ứng tiêu chí</th>
      <th scope="col">Tài nguyên thực hành</th>
    </tr>
    <tr>
      <td>1.4.1 Dùng màu sắc (A)</td>
      <td>
        <p>
          Không nên chỉ dựa vào màu sắc để truyền đạt thông tin. Ví dụ, trong
          biểu mẫu, bạn không bao giờ nên đánh dấu các trường bắt buộc chỉ bằng
          một màu (như đỏ). Thay vào đó (hoặc đồng thời), một dấu sao cùng nhãn
          "bắt buộc" sẽ phù hợp hơn.
        </p>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Use_of_color"
          >Việc dùng màu sắc</a
        >,
        <a
          href="/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#color_and_color_contrast"
          >Màu sắc và độ tương phản màu</a
        >,
        và
        <a
          href="/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form#multiple_labels"
          >Nhãn nhiều hơn một</a
        >.
      </td>
    </tr>
    <tr>
      <td>1.4.2 Điều khiển âm thanh (A)</td>
      <td>
        Với bất kỳ âm thanh nào phát dài hơn ba giây, hãy cung cấp điều khiển có
        thể truy cập để phát và tạm dừng âm thanh/video, và để tắt/bật âm lượng.
      </td>
      <td>
        Dùng các <code>&lt;button&gt;</code> gốc để cung cấp điều khiển bàn
        phím có thể truy cập, như được minh họa trong
        <a
          href="/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Video_player_styling_basics"
          >Video player styling basics</a
        >.
      </td>
    </tr>
    <tr>
      <td>1.4.3 Độ tương phản tối thiểu (AA)</td>
      <td>
        <p>
          Độ tương phản màu giữa nền và nội dung phía trước nên đạt mức tối thiểu
          để bảo đảm khả năng đọc:
        </p>
        <ul>
          <li>
            Văn bản và nền của nó nên có tỷ lệ tương phản ít nhất 4,5:1.
          </li>
          <li>
            Tiêu đề (hoặc văn bản lớn hơn) nên có tỷ lệ ít nhất 3:1. Văn bản lớn
            được định nghĩa là ít nhất 18pt, hoặc 14pt đậm.
          </li>
        </ul>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast"
          >Tương phản màu</a
        > và
        <a
          href="/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#color_and_color_contrast"
          >Màu sắc và độ tương phản màu</a
        >.
      </td>
    </tr>
    <tr>
      <td>1.4.4 Phóng to văn bản (AA)</td>
      <td>
        Trang nên đọc được và sử dụng được khi kích thước văn bản được nhân đôi.
        Điều này có nghĩa là thiết kế nên có khả năng phản hồi, để khi kích
        thước văn bản tăng lên thì nội dung vẫn còn truy cập được.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>1.4.5 Hình ảnh của văn bản (AA)</td>
      <td>
        KHÔNG nên dùng hình ảnh để trình bày nội dung mà văn bản có thể làm tốt
        công việc đó. Ví dụ, nếu một hình ảnh chủ yếu là văn bản, nó cũng có thể
        được biểu diễn bằng văn bản cùng với hình ảnh.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>1.4.6 Tương phản tăng cường (AAA)</td>
      <td>
        <p>Tiêu chí này theo sau, và mở rộng, tiêu chí 1.4.3.</p>
        <ul>
          <li>
            Văn bản và nền của nó nên có tỷ lệ tương phản ít nhất 7:1.
          </li>
          <li>
            Tiêu đề (hoặc văn bản lớn hơn) nên có tỷ lệ ít nhất 4,5:1. Văn bản
            lớn được định nghĩa là ít nhất 18pt, hoặc 14pt đậm.
          </li>
        </ul>
      </td>
      <td>
        Xem
        <a
          href="/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#color_and_color_contrast"
          >Màu sắc và độ tương phản màu</a
        >.
      </td>
    </tr>
    <tr>
      <td>1.4.7 Âm thanh nền thấp hoặc không có (AAA)</td>
      <td>
        Các bản ghi âm đã ghi sẵn chủ yếu là lời nói nên có tiếng nền ở mức tối
        thiểu, để nội dung có thể được hiểu dễ dàng.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>1.4.8 Trình bày trực quan (AAA)</td>
      <td>
        <p>Đối với trình bày nội dung văn bản, các điều sau nên đúng:</p>
        <ul>
          <li>Màu nền và màu tiền cảnh nên do người dùng chọn được.</li>
          <li>
            Khối văn bản không nên rộng quá 80 ký tự (hoặc ký hiệu), để dễ đọc
            nhất.
          </li>
          <li>Văn bản không nên được canh đều hoàn toàn (ví dụ, <code>text-align: justify;</code>).</li>
          <li>
            Chiều cao dòng nên ít nhất gấp 1,5 lần kích thước văn bản trong đoạn
            (ví dụ, <code>line-height: 1.5;</code>), và ít nhất gấp 2,25 lần
            kích thước văn bản giữa các đoạn (ví dụ, <code>padding: 2.25rem;</code>).
          </li>
          <li>
            Khi kích thước văn bản được nhân đôi, nội dung không nên cần cuộn.
          </li>
        </ul>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>1.4.9 Hình ảnh của văn bản (Không ngoại lệ) (AAA)</td>
      <td>
        Văn bản không nên được trình bày như một phần của hình ảnh, trừ khi nó
        chỉ là trang trí (tức là không truyền đạt nội dung nào) hoặc không thể
        được trình bày theo bất kỳ cách nào khác.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        1.4.10 Tái bố cục (AA)
      </td>
      <td>
        <ul>
          <li>
            Không cuộn ngang đối với các ngôn ngữ từ trái sang phải (như tiếng
            Anh) hoặc từ phải sang trái (như tiếng Ả Rập)
          </li>
          <li>
            Không cuộn dọc đối với các ngôn ngữ từ trên xuống dưới (như tiếng
            Nhật)
          </li>
          <li>
            Ngoại trừ các phần nội dung cần bố cục hai chiều cho việc sử dụng
            hoặc ý nghĩa (như một bảng dữ liệu lớn)
          </li>
        </ul>
      </td>
      <td>
        <a href="https://www.w3.org/WAI/WCAG21/Understanding/reflow.html"
          >Hiểu về Tái bố cục</a
        >
      </td>
    </tr>
    <tr>
      <td>
        1.4.11 Tương phản không phải văn bản (AA)
      </td>
      <td>
        Tỷ lệ tương phản màu tối thiểu 3:1 cho các thành phần giao diện người
        dùng và các đối tượng đồ họa.
      </td>
      <td>
        <a
          href="https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html"
          >Hiểu về Tương phản không phải văn bản</a
        >
      </td>
    </tr>
    <tr>
      <td>
        1.4.12 Giãn cách văn bản (AA)
      </td>
      <td>
        <p>
          Không có sự mất nội dung hay chức năng nào xảy ra khi áp dụng các kiểu
          sau:
        </p>
        <ul>
          <li>Chiều cao dòng (khoảng cách dòng) ít nhất 1,5 lần kích thước phông chữ</li>
          <li>
            Khoảng cách sau đoạn ít nhất 2 lần kích thước phông chữ
          </li>
          <li>
            Khoảng cách chữ (tracking) ít nhất 0,12 lần kích thước phông chữ
          </li>
          <li>Khoảng cách từ giữa các từ ít nhất 0,16 lần kích thước phông chữ</li>
        </ul>
      </td>
      <td>
        <a href="https://www.w3.org/WAI/WCAG21/Understanding/text-spacing.html"
          >Hiểu về Giãn cách văn bản</a
        >
      </td>
    </tr>
    <tr>
      <td>
        1.4.13 Nội dung khi rê chuột hoặc focus (AA)
      </td>
      <td>
        <p>
          Mặc dù nội dung bổ sung có thể xuất hiện và biến mất đồng bộ với việc
          rê chuột và focus bằng bàn phím, tiêu chí thành công này quy định ba
          điều kiện phải được đáp ứng:
        </p>
        <ul>
          <li>có thể loại bỏ (có thể đóng/xóa)</li>
          <li>
            có thể rê chuột qua (nội dung bổ sung không biến mất khi con trỏ
            đang ở trên nó)
          </li>
          <li>
            tồn tại bền (nội dung bổ sung không biến mất nếu không có hành động
            của người dùng)
          </li>
        </ul>
      </td>
      <td>
        <a
          href="https://www.w3.org/WAI/WCAG21/Understanding/content-on-hover-or-focus.html"
          >Hiểu về Nội dung khi rê chuột hoặc focus</a
        >
      </td>
    </tr>
  </thead>
</table>

> [!NOTE]
> Cũng xem mô tả WCAG cho [Hướng dẫn 1.4: Có thể phân biệt: Làm cho người dùng dễ nhìn và nghe nội dung hơn, bao gồm tách tiền cảnh khỏi nền.](https://w3c.github.io/wcag/guidelines/22/#distinguishable)

## Xem thêm

- [WCAG](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG)
  1. [Có thể nhận biết](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable)
  2. [Có thể vận hành](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable)
  3. [Dễ hiểu](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable)
  4. [Mạnh mẽ](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Robust)
