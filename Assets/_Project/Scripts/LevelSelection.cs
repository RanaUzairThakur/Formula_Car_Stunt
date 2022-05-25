using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class LevelSelection : MonoBehaviour
{
    public GameObject[] LevelBtns;

    public GameObject[] Locks;
    public GameObject[] Stars;
    public Text[] Txts;

    // Start is called before the first frame update
    void OnEnable()
    {
        Locks = new GameObject[LevelBtns.Length];
        Stars = new GameObject[LevelBtns.Length];
        Txts = new Text[LevelBtns.Length];
        for (int i = 0;i< LevelBtns.Length;i++)
        {
            //if(LevelBtns[i].transform.childCount<=0)
            //{
            //    Debug.Log("no child");
            //    continue;
            //}
            //else
            //{
            //    Debug.Log(LevelBtns[i].name+" child count: "+ LevelBtns[i].transform.childCount+"1: "+ LevelBtns[i].transform.GetChild(0).gameObject.name+" and 2: "+ LevelBtns[i].transform.GetChild(1).gameObject.name);
            //}

            Locks[i] = LevelBtns[i].transform.GetChild(1).gameObject;
            Stars[i] = LevelBtns[i].transform.GetChild(2).gameObject;
            Txts[i] = LevelBtns[i].transform.GetChild(0).gameObject.GetComponent<Text>();
        }

        //Highlights = new GameObject[ModeBtns.Length];
        //for(int i = 0;i<Highlights.Length;i++)
        //{
        //    Highlights[i] = ModeBtns[i].transform.GetChild(1).gameObject;
        //}
        //RefreshModeSelection();

        RefreshLevelSelection();
    }
    //void RefreshModeSelection()
    //{
    //    for (int i = 0; i < Highlights.Length; i++)
    //    {
    //        if((i)==PlayerPrefs.GetInt("CurrentMode", 0))
    //        Highlights[i].SetActive(true);
    //        else
    //        Highlights[i].SetActive(false);
    //    }
    //}
    void RefreshLevelSelection()
    {
        int unlocked = PlayerPrefs.GetInt("Unlocked"+ PlayerPrefs.GetInt("CurrentMode", 0).ToString(), 0);
        for (int i = 0; i < LevelBtns.Length; i++)
        {
            Txts[i].text = (PlayerPrefs.GetInt("CurrentMode", 0)+1).ToString()+"-"+(i+1).ToString();

            if (i <= unlocked)
            {
                //Txts[i].SetActive(true);
                LevelBtns[i].GetComponent<Button>().interactable = true;
                Locks[i].SetActive(false);
                Stars[i].SetActive(true);

            }
            else
            {
                //Txts[i].SetActive(false);
                LevelBtns[i].GetComponent<Button>().interactable = false;
                Locks[i].SetActive(true);
                Stars[i].SetActive(false);
            }
        }
        print("Mode :"+ PlayerPrefs.GetInt("CurrentMode", 0));
    }
    public void SelectMode(int mode)
    {
        PlayerPrefs.SetInt("CurrentMode", mode);
       // RefreshModeSelection();
        RefreshLevelSelection();
    }

}
