using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class UIAnimator : MonoBehaviour {

    [Header("Move in X")]
    public bool MoveInX = false;
    public float StartX;
    public float EndX;
    public Ease XEasy = Ease.Linear;

    [Header("Move in Y")]
    public bool MoveInY = false;
    public float StartY;
    public float EndY;
    public Ease YEasy = Ease.Linear;

    [Header("Scale in XY")]
    public bool ScaleXY = false;
    public bool PopingEffect = false;
    public float StartScale = 0;
    public float EndScale = 1;
    public Ease ScaleEase = Ease.InOutBounce;
    public float ScaleTime = 0.5f;

    [Header("Do Not Animate If Aready On EndPoint - Exceptional")]
    public bool DNAIAOEP = false;

    [Header("FadeInOut")]
    public bool DoFade = false;
    public float StartAlpha = 0;
    public Ease AlphaEase = Ease.Linear;

    [Header("Color Tween")]
    public bool isImage = true;
    public bool isText = false;
    public bool DoColorTween = false;
    public Color StartColor = new Color(1f, 1f, 1f, 0);
    public Color EndColor = new Color(1f, 1f, 1f, 1f);
    public float DoColorTime = 1f;
    public Ease ColorEase = Ease.Linear;

    [Header("Time")]
    public float time = 1f;
    public float delay = 0f;

    [Header("General")]
    public bool IgnoreTimescale = true;
    public bool StartOnEnable = true;
    public bool Repeating = false;
    public float RepeatingTime = 5f;
    public bool DisableOnComplete = false;
    public GameObject DisableObject;

    private RectTransform _thisRect;
    private Image _image;
    private Text _text;

    void OnEnable()
    {
        if (isImage)
            _image = GetComponent<Image>();
        if (isText)
            _text = GetComponent<Text>();

        _thisRect = GetComponent<RectTransform>();
        
        if (StartOnEnable)
            StartCoroutine( DoAnimate());

        if (Repeating)
            InvokeRepeating("RepeatMethod", RepeatingTime, RepeatingTime);
    }

    private void OnDisable()
    {
        StopAllCoroutines();
        CancelInvoke();
    }

    public void MoveXInOut (bool status)
    {
        if (status)
        {
            _thisRect.anchoredPosition = new Vector2(StartX, _thisRect.anchoredPosition.y);
            _thisRect.DOAnchorPosX(EndX, time, false).SetUpdate(IgnoreTimescale); ;
        }else
        {
            _thisRect.anchoredPosition = new Vector2(EndX, _thisRect.anchoredPosition.y);
            _thisRect.DOAnchorPosX(StartX, time, false).SetUpdate(IgnoreTimescale); ;
        }
    }

    public IEnumerator DoAnimate ()
    {
        if (MoveInX && !MoveInY)
        {
            _thisRect.anchoredPosition = new Vector2(StartX, _thisRect.anchoredPosition.y);
        }
        if (!MoveInX && MoveInY)
        {
            _thisRect.anchoredPosition = new Vector2(_thisRect.anchoredPosition.x, StartY);
        }
        if (MoveInX && MoveInY)
        {
            _thisRect.anchoredPosition = new Vector2(StartX, StartY);
        }
        if (DoFade)
        {
            _image.color = new Color(_image.color.r, _image.color.g, _image.color.b, StartAlpha);
        }
        if (DoColorTween)
        {
            if (isImage)
                _image.color = StartColor;
            if (isText)
                _text.color = StartColor;
        }

        if (ScaleXY)
        {
            transform.localScale = Vector3.one * StartScale;
        }

        yield return new WaitForSeconds(delay);

        if (MoveInX && !MoveInY)
        {
            _thisRect.DOAnchorPosX(EndX, time, false).SetUpdate(IgnoreTimescale).SetEase(XEasy);
        }
        if (!MoveInX && MoveInY)
        {
            _thisRect.DOAnchorPosY(EndY, time, false).SetUpdate(IgnoreTimescale).SetEase(YEasy);
        }
        if (MoveInX && MoveInY)
        {
            _thisRect.DOAnchorPos(new Vector2(EndX, EndY), time, false).SetUpdate(IgnoreTimescale).SetEase(YEasy);
        }
        if (DoFade)
        {
            _image.DOFade(1f, time / 2f).OnComplete(OnCompleteFade).SetUpdate(IgnoreTimescale).SetEase(AlphaEase);
        }
        if (DoColorTween)
        {
            if (isImage)
                _image.DOColor(EndColor, DoColorTime).SetEase(ColorEase).SetUpdate(IgnoreTimescale);
            if (isText)
                _text.DOColor(EndColor, DoColorTime).SetEase(ColorEase).SetUpdate(IgnoreTimescale);
        }
        if (ScaleXY && !PopingEffect)
        {
            transform.DOScale(EndScale, ScaleTime).SetUpdate(IgnoreTimescale).SetEase(ScaleEase);
        }
        if (ScaleXY && PopingEffect)
        {
            transform.DOScale(EndScale, ScaleTime/2).SetUpdate(IgnoreTimescale).OnComplete(popingEffect).SetUpdate(IgnoreTimescale).SetEase(ScaleEase);
        }
    }

    public void popingEffect ()
    {
        transform.DOScale(StartScale, ScaleTime/2).SetUpdate(IgnoreTimescale);
    }

    private void RepeatMethod()
    {
        StartCoroutine(DoAnimate());
    }

    void OnCompleteFade()
    {
        _image.DOFade(0, time / 2f);
    }

    void OnCompleteDisable ()
    {
        if (DisableOnComplete)
        {
            DisableObject.SetActive(false);
        }
    }

}
