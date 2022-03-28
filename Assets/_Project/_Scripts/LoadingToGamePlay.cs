using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LoadingToGamePlay : MonoBehaviour
{
    public GameObject loading;
    public Text loadingText;
    public GameObject loadingBar;

    //void Start()
    //{
    //    Invoke("GameplayStunt", 4f);
    //   // StartCoroutine(LoadScene());
    //}
    private void OnEnable()
    {
        Invoke("Load", 4f);

    }
    void Load()
    {
        SceneManager.LoadScene("GameplayStunt");
    }
    //IEnumerator LoadScene()
    //{
    //    yield return null;

    //    Time.timeScale = 1;

    //    AsyncOperation asyncOperation = SceneManager.LoadSceneAsync("GameplayStunt");

    //    asyncOperation.allowSceneActivation = false;

    //    while (!asyncOperation.isDone)
    //    {
    //        loadingBar.GetComponent<Image>().fillAmount += 0.009f;
    //        string percent = (loadingBar.GetComponent<Image>().fillAmount * 100).ToString("F0");
    //        loadingText.text = string.Format("<size=35>{0}%</size>", percent);

    //        if (asyncOperation.progress >= 0.9f && loadingBar.GetComponent<Image>().fillAmount == 1.0f)
    //        {

    //            asyncOperation.allowSceneActivation = true;

    //        }
    //        yield return null;
    //    }
    //}
}
