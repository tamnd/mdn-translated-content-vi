---
title: Có thể thao tác
slug: Web/Accessibility/Guides/Understanding_WCAG/Operable
page-type: guide
sidebar: accessibilitysidebar
---

Bài viết này cung cấp lời khuyên thực tế về cách viết nội dung web của bạn sao cho tuân thủ các tiêu chí thành công được nêu trong nguyên tắc **Operable** của Web Content Accessibility Guidelines (WCAG) 2.0 và 2.1. Operable nói rằng các thành phần giao diện người dùng và điều hướng phải có thể thao tác được.

> [!NOTE]
> Để đọc định nghĩa của W3C về Operable cùng các nguyên tắc và tiêu chí thành công của nó, xem [Principle 2: Operable — User interface components and navigation must be operable.](https://w3c.github.io/wcag/guidelines/22/#operable)

## Guideline 2.1 — Keyboard Accessible: Make all functionality available from a keyboard

Nguyên tắc này bao quát việc cần làm cho chức năng cốt lõi của website có thể dùng được bằng bàn phím bên cạnh các cách khác (ví dụ: chuột), để những người phụ thuộc vào điều khiển bằng bàn phím có thể truy cập.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Success criteria</th>
      <th scope="col">How to conform to the criteria</th>
      <th scope="col">Practical resource</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2.1.1 Keyboard (A)</td>
      <td>
        Tất cả chức năng nên có thể truy cập bằng điều khiển bàn phím, trừ khi
        không thể làm bằng bàn phím (ví dụ, vẽ tự do). Nên dùng các điều khiển
        sẵn có khi có thể (ví dụ, dùng Tab để đi qua các form control), và chỉ
        xây dựng chức năng tùy chỉnh khi thật sự cần.
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_semantic_ui_controls_where_possible"
          >Use semantic UI controls where possible</a
        >
        và
        <a
          href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#building_keyboard_accessibility_back_in"
          >Building keyboard accessibility back in</a
        >
      </td>
    </tr>
    <tr>
      <td>2.1.2 No keyboard trap (A)</td>
      <td>
        <p>
          Khi vào một phần chức năng bằng bàn phím, bạn cũng phải có thể thoát
          ra khỏi phần đó chỉ bằng bàn phím. Ví dụ, nếu bạn nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>
          trên một nút đang được focus để mở một cửa sổ tùy chọn, bạn cũng phải
          có thể đóng cửa sổ đó và quay lại nội dung chính bằng bàn phím.
        </p>
        <p>
          Điều này rất quan trọng để người dùng bàn phím không bị mắc kẹt trong
          các phần cụ thể của ứng dụng.
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>2.1.3 Keyboard — all functionality (AAA)</td>
      <td>
        Đây là bước tiếp theo sau tiêu chí 2.1.1. Để đạt mức tuân thủ AAA, mọi
        chức năng đều phải có thể truy cập bằng điều khiển bàn phím - không có
        ngoại lệ.
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_semantic_ui_controls_where_possible"
          >Use semantic UI controls where possible</a
        >
        và
        <a
          href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#building_keyboard_accessibility_back_in"
          >Building keyboard accessibility back in</a
        >
      </td>
    </tr>
    <tr>
      <td>
        2.1.4 Character Key Shortcuts (A)
      </td>
      <td>
        Nếu có phím tắt dùng một ký tự, thì ít nhất một trong các điều sau phải
        đúng: phím tắt một ký tự có thể tắt được, đổi ánh xạ được hoặc chỉ hoạt
        động khi thành phần giao diện người dùng liên quan đang được focus.
      </td>
      <td>
        <a
          href="https://www.w3.org/WAI/WCAG21/Understanding/character-key-shortcuts.html"
          >Understanding Character Key Shortcuts</a
        >
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem phần mô tả WCAG cho [Guideline 2.1 Keyboard Accessible: Make all functionality available from a keyboard](https://w3c.github.io/wcag/guidelines/22/#keyboard-accessible).

## Guideline 2.2 — Enough Time: Provide users enough time to read and use content

Nguyên tắc này bao quát các tình huống mà chức năng có thể bị giới hạn thời gian. Ví dụ, các giao dịch mua đôi khi phải hoàn tất trong một khoảng thời gian nhất định vì lý do bảo mật.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Success criteria</th>
      <th scope="col">How to conform to the criteria</th>
      <th scope="col">Practical resource</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2.2.1 Timing is adjustable (A)</td>
      <td>
        <p>
          Với các chức năng có giới hạn thời gian (ví dụ, hoàn tất đặt phòng
          khách sạn hoặc chuyến bay thường có giới hạn thời gian), người dùng
          nên được cung cấp các điều khiển để có thể điều chỉnh, gia hạn hoặc
          tắt giới hạn thời gian.
        </p>
        <p>
          Các ngoại lệ là hoạt động có giới hạn thời gian dài hơn 20 giờ, sự
          kiện thời gian thực (ví dụ, trò chơi nhiều người chơi trực tiếp), và
          bất kỳ hoạt động nào khác yêu cầu giới hạn thời gian và sẽ không còn
          hợp lệ nếu bị tắt.
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>2.2.2 Pausing, stopping, hiding (A)</td>
      <td>
        <p>
          Với nội dung chuyển động/nhấp nháy bắt đầu tự động, kéo dài hơn 5 giây,
          và được hiển thị cùng nội dung khác, cần cung cấp điều khiển để tạm
          dừng, dừng hẳn hoặc ẩn nó đi. Điều này không áp dụng cho nội dung
          chuyển động/nhấp nháy là thiết yếu đối với trải nghiệm. Ví dụ gồm
          văn bản chạy và video.
        </p>
        <p>
          Với thông tin tự cập nhật bắt đầu tự động và được hiển thị cùng nội
          dung khác, cần cung cấp điều khiển để tạm dừng, dừng hẳn hoặc ẩn nó
          đi, hoặc để kiểm soát tần suất cập nhật. Điều này không áp dụng cho
          nội dung tự cập nhật là thiết yếu đối với trải nghiệm. Ví dụ gồm
          carousel hoặc các thông báo luân phiên.
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>2.2.3 No time limits (AAA)</td>
      <td>
        Tiêu chí này dựa trên 2.2.1, nêu rằng nội dung muốn đạt mức AAA thì
        không nên có giới hạn thời gian.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>2.2.4 Suppress interruptions (AAA)</td>
      <td>
        Bất kỳ gián đoạn nào như cảnh báo hoặc quảng cáo xen kẽ đều nên có chức
        năng để chặn hoặc trì hoãn chúng, trừ khi đó là cảnh báo khẩn cấp.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>2.2.5 Re-authenticating (AAA)</td>
      <td>
        Nếu một phiên xác thực hết hạn trong khi đang dùng ứng dụng web, người
        dùng có thể xác thực lại và tiếp tục sử dụng mà không mất dữ liệu nào.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        2.2.6 Timeouts (AAA)
      </td>
      <td>
        <p>
          Nếu có một timeout (do người dùng không tương tác) thì hãy cảnh báo
          người dùng ngay từ đầu quy trình để họ không bất ngờ khi timeout xảy
          ra (hoặc chỉ cho phép timeout xảy ra sau 20 giờ không hoạt động).
        </p>
      </td>
      <td>
        <a href="https://www.w3.org/WAI/WCAG21/Understanding/timeouts.html"
          >Understanding Timeouts</a
        >
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem phần mô tả WCAG cho [Guideline 2.2 Enough Time: Provide users enough time to read and use content](https://w3c.github.io/wcag/guidelines/22/#enough-time).

## Guideline 2.3 — Seizures and Physical Reactions: Do not design content in a way that is known to cause seizures or physical reactions

Nguyên tắc này đề cập đến nội dung mà nếu không thay đổi có thể gây co giật cho người dùng có các tình trạng như động kinh, hoặc có thể gây phản ứng thể chất (như chóng mặt) cho người dùng có các tình trạng như rối loạn tiền đình.

<table>
  <thead>
    <tr>
    <th scope="col">Success criteria</th>
    <th scope="col">How to conform to the criteria</th>
    <th scope="col">Practical resource</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2.3.1 Three flashes, or below threshold (A)</td>
      <td>Nội dung không chứa bất kỳ yếu tố nào nhấp nháy hơn ba lần mỗi giây, hoặc nội dung nhấp nháy nằm dưới các ngưỡng chớp và chớp đỏ chấp nhận được.</td>
      <td></td>
    </tr>
    <tr>
      <td>2.3.2 Three flashes (AAA)</td>
      <td>Nội dung không chứa bất kỳ yếu tố nào nhấp nháy hơn ba lần mỗi giây.</td>
      <td></td>
    </tr>
    <tr>
      <td>2.3.3 Animations from Interactions (AAA)</em></td>
      <td>Cho phép người dùng tắt các hoạt ảnh do tương tác (trừ khi hoạt ảnh là thiết yếu).</td>
      <td><a href="https://w3c.github.io/wcag/guidelines/22/#animation-from-interactions">Understanding Animations from Interactions</a></td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem phần mô tả WCAG cho [Guideline 2.3 Seizures and Physical Reactions: Do not design content in a way that is known to cause seizures or physical reactions.](https://w3c.github.io/wcag/guidelines/22/#seizures-and-physical-reactions)

## Guideline 2.4 — Navigable: Provide ways to help users navigate, find content, and determine where they are

Các tiêu chí tuân thủ dưới nguyên tắc này liên quan đến những cách mà người dùng có thể định hướng bản thân, và tìm nội dung cùng chức năng họ cần trên trang hiện tại hoặc các trang khác của site.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Success criteria</th>
      <th scope="col">How to conform to the criteria</th>
      <th scope="col">Practical resource</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2.4.1 Bypass blocks (A)</td>
      <td>
        <p>
          Cần cung cấp một cơ chế cho phép người dùng bỏ qua trực tiếp đến nội
          dung hoặc chức năng chính của trang, đi qua các phần lặp lại (như logo
          công ty hoặc điều hướng). Điều này thường đạt được bằng "skip links" -
          các liên kết đặt ở đầu mã nguồn trang, trỏ đến nội dung chính và được
          ẩn bằng CSS.
        </p>
