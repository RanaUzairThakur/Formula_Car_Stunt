using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class FadeIn : MonoBehaviour
{
    public float taketime;
    CanvasGroup canvasGroup;
    float time = 0;
    //Start is called before the first frame update

    void OnEnable()
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
  
        //Toolbox.GameManager.Permanent_Log("FadeInout");
        while (time < duration )
        {
            canvasGroup.alpha = Mathf.Lerp(startValue, targetValue, time / duration);
            time += Time.deltaTime;
            yield return null;
        }
        // fade = true;
        canvasGroup.alpha = targetValue;
     //   StartCoroutine(FadeLoadingScreen(0f, taketime));
    }
   
    private void OnDisable()
    {
        canvasGroup.alpha = 0f;
        time = 0f;
        StopAllCoroutines();
    }
}
