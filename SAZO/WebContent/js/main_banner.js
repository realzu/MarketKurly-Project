        var main_v_list = document.querySelector('.main_v_list');
        var slides = document.querySelectorAll('.main_v_list li');
        var currendIdx1 = 0;
        var slideCount1 = slides.length;
        var slideWidth1 = 1920;
        var slideMargin1 = 0;
        var nextBtn1 = document.querySelector('.arrow_right1');
        var prevBtn1 = document.querySelector('.arrow_left1');

        main_v_list.style.width = (slideWidth1 + slideMargin1) * slideCount1- slideMargin1 + 'px';

        function moveSlide1(num) {
            main_v_list.style.left = -num * 1920 + 'px';
            currendIdx1 = num;
        }

        nextBtn1.addEventListener('click', function() {
            if (currendIdx1 < slideCount1 - 1) {
                moveSlide1(currendIdx1 + 1);
            } else {
                moveSlide1(0);
                
            }
        });

        prevBtn1.addEventListener('click',function(){
            if(currendIdx1>0){
                moveSlide1(currendIdx1-1);
            }else{
                moveSlide1(slideCount1 -1);
            }
        });

