using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class FadeIn : MonoBehaviour
{
    public float taketime;
    CanvasGroup canvasGroup;

    //Start is called before the first frame update

    void Start()
    {
        canvasGroup = GetComponent<CanvasGroup>();
        FadeEffect();
    }


    public void FadeEffect()
    {
        StartCoroutine(FadeLoadingScreen(1f, taketime));
    }

    public IEnumerator FadeLoadingScreen(float targetValue, float duration)
    {
        float startValue = canvasGroup.alpha;
        float time = 0;
        bool fade = false;
        bool fadein = false;
        //Toolbox.GameManager.Permanent_Log("FadeInout");
        while (time < duration && !fade)
        {
            canvasGroup.alpha = Mathf.Lerp(startValue, targetValue, time / duration);
            time += Time.deltaTime;
            yield return null;
        }
        // fade = true;
        canvasGroup.alpha = targetValue;
        StartCoroutine(FadeLoadingScreen(0f, taketime));
    }
    public IEnumerator FadeoutLoadingScreen(float targetValue, float duration)
    {
        float startValue = canvasGroup.alpha;
        float time = 0;
        bool fade = false;
        bool fadein = false;
        //Toolbox.GameManager.Permanent_Log("FadeInout");
        while (time < duration && !fade)
        {
            canvasGroup.alpha = Mathf.Lerp(startValue, targetValue, time / duration);
            time += Time.deltaTime;
            yield return null;
        }
        canvasGroup.alpha = targetValue;

    }
}
